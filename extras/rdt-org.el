(use-package rdt-org
  :ensure nil
  :no-require t
  :config
  (use-package org
    :init
    (setq org-startup-folded t
          org-log-done t)
    :bind (("C-c l" . 'org-store-link)
           ("C-c a" . 'org-agenda))
    :config
    (setq org-support-shift-select t)
    (setq org-log-done t)
    (setq org-directory "~/Dropbox/orgfiles")
    (setf org-agenda-tags-column 100)
    (setf org-agenda-include-diary t)
    (setq org-todo-keywords
          '((sequence "TODO(t)"
                      "MAYBE"
                      "NEXT"
                      "STARTED"
                      "WAITING"
                      "DELEGATED"
                      "|"
                      "DONE(d)"
                      "CANCELLED(c)")
            (sequence
             "MEETING(m)"
             "|"
             "DONE(d)"
             "CANCELLED(c)")))
    (setf org-group-tags nil)
    (setf org-tag-persistent-alist '(("personal" . ?p)
                                     ("houses" . ?h)
                                     ("vacations" . ?v)
                                     ("management" . ?m)
                                     ("csw" . ?w)
                                     ("coding" . ?c)
                                     ("training" . ?t)
                                     ("configuration" . ?f)))
    ;; Babel
    (setq org-babel-python-command "/usr/bin/python3")
    (org-babel-do-load-languages
     'org-babel-load-languages '((python . t)
                                 (fortran . t)
                                 (C . t)
                                 (lisp . t)
                                 (shell . t)))
    ;; Calendar
    (setq holiday-general-holidays nil
          holiday-christian-holidays nil
          holiday-hebrew-holidays nil
          holiday-islamic-holidays nil
          holiday-bahai-holidays nil
          holiday-oriental-holidays nil
          holiday-solar-holidays nil)

    (setq holiday-local-holidays '((holiday-fixed 1 1 "Dia ano novo")
                                   (holiday-fixed 2 14 "Valentine's Day")
                                   (holiday-easter-etc -40 "Carnaval")
                                   (holiday-easter-etc -2 "Sexta-feira santa")
                                   (holiday-easter-etc 0 "Páscoa")
                                   (holiday-easter-etc 60 "Corpo de Cristo")
                                   (holiday-fixed 3 19 "Dia do Pai")
                                   (holiday-fixed 4 25 "25 Abril")
                                   (holiday-fixed 5 1 "Dia trabalhador")
                                   (holiday-float 5 0 1 "Dia da Mãe")
                                   (holiday-fixed 6 1 "Dia da criança")
                                   (holiday-fixed 6 10 "Dia Portugal")
                                   (holiday-fixed 6 13 "Dia S António (Lisboa)")
                                   (holiday-fixed 8 15 "Dia S Assunção")
                                   (holiday-fixed 10 5 "Implantação da républica")
                                   (holiday-fixed 11 1 "Todos os santos")
                                   (holiday-fixed 12 1 "Restauração da Independência")
                                   (holiday-fixed 12 8 "Dia Imaculada conceição")
                                   (holiday-fixed 12 25 "Christmas"))))
  
  
  (use-package helm-org
    :ensure t)
  (add-to-list 'helm-completing-read-handlers-alist '(org-capture . helm-org-completing-read-tags))
  (add-to-list 'helm-completing-read-handlers-alist '(org-set-tags-command . helm-org-completing-read-tags))

  ;; Resize Org headings
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 0.98)
                  (org-level-6 . 0.96)
                  (org-level-7 . 0.94)
                  (org-level-8 . 0.92)))
    (set-face-attribute (car face) nil :font my/variable-width-font :weight 'medium :height (cdr face)))

  (set-face-attribute 'org-document-title nil :font my/variable-width-font :weight 'bold :height 1.3)

  
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-block nil :foreground 'unspecified :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
  (setq org-startup-with-inline-images t)

  (use-package org-superstar
    :ensure t
    :hook (org-mode . (lambda () (org-superstar-mode t))))

  ;; Denote
  (use-package denote
    :ensure t
    :config     (setq denote-directory (expand-file-name "~/Dropbox/orgfiles/denotes/"))
    (setq denote-known-keywords '("emacs" "programming" "journal"))
    (setq denote-date-prompt-use-org-read-date t))

  ;; Denote functions
  (require 'cl-lib)

  (defun journals_to_org_agenda ()
    "get journals since last month"
    (let* ((min_date (format-time-string "%Y%m%d"
                                         (encode-time
                                          (decoded-time-add (parse-time-string
                                                             (calendar-date-string
                                                              (calendar-current-date)))
                                                            (make-decoded-time :month (- 1))))))
           (all_journals (sort
                          (directory-files denote-directory nil "^[0-9].*_journal.*org$")
                          #'string>))
           (out_list nil))
      (dolist (journal all_journals out_list)
        (when (string> (substring journal 0 8) min_date)
          (push (concat denote-directory journal) out_list)))))

  (defun my-denote-current-file-path ()
    "Return the path to the current denote file, creating it if necessary."
    (let* ((current-files (directory-files denote-directory t "__current\\.org$")))
      (if current-files
          (car current-files)
        ;; Create current file if it doesn't exist
        (let ((denote-prompts '())
              (denote-use-title "Current Notes")
              (denote-use-signature "current"))
          (save-window-excursion
            (call-interactively #'denote)
            (buffer-file-name))))))

  (setq org-agenda-files (append '("~/Dropbox/orgfiles/todo.org")
                                 (list (my-denote-current-file-path))
                                 (journals_to_org_agenda)))

  (defun journal-day-exists-p ( target )
    "check if journal for a day already exists"
    (file-expand-wildcards (concat denote-directory target "*_journal*.org")))

  (defun find-previous-journal ()
    "Find most recent journal"
    (let* ((today (format-time-string "%Y%m%d"))
           (all_journals (sort (directory-files "~/Dropbox/orgfiles/denotes" nil "^[0-9].*_journal.*org$") #'string>)))
      (dolist (journal all_journals)
        (when (string< (substring journal 0 8) today)
          (cl-return journal)))))

  (defun my-refile-tasks (file)
    (interactive)
    (let* ((org-archive-location (concat file "::* TASKS"))
           (org-archive-save-context-info nil))

      (goto-char (point-min))
      (unless (re-search-forward "^\\* TASKS" nil t)
        (goto-char (point-max))
        (insert "* TASKS\n\n"))
      (goto-char (point-max))
      (while
          (re-search-backward
           "^\\*\\* \\(TODO\\|MAYBE\\|NEXT\\|STARTED\\|WAITING\\|DELEGATED\\|MEETING\\|SCHEDULED\\|DEADLINE\\)" nil t)
        (org-archive-subtree))))

  (defun move-todos()
    (let ((filename (concat denote-directory
                            (find-previous-journal))))
      (find-file filename)
      (my-refile-tasks (car
                        (journal-day-exists-p
                         (format-time-string "%Y%m%d"))))
      (save-buffer)
      (kill-buffer (buffer-name))))

  (defun my-denote-journal-today ()
    "Create an entry tagged 'journal' with the date as its title."
    (interactive)
    (let* ((today (format-time-string "%Y%m%d"))
           (filename (car (journal-day-exists-p today)))
           (prev (find-previous-journal)))
      (if filename
          (find-file filename)
        (progn
          (denote
           (format-time-string "%Yw%W-%a %e %b")   ; format like 2022w48-Tue 29 Nov
           '("journal")
           nil
           "~/Denotes")
          (insert "* THOUGHTS\n\n* NOTES\n\n* CODE\n\n* TASKS\n\n")
          (save-buffer)
          (move-todos)
          (setq org-agenda-files (append '("~/Dropbox/orgfiles/todo.org")
                                         (list (my-denote-current-file-path))
                                         (journals_to_org_agenda)))))))

  (defun my-denote-journal-date()
    (declare (interactive-only t))
    (interactive)
    (let* ((date (org-read-date nil t))
           (filename (car (journal-day-exists-p (format-time-string "%Y%m%d" date)))))
      (if filename
          (find-file filename)
        (progn
          (denote
           (format-time-string "%Yw%W-%a %e %b" date)   ; format like Tuesday 14 June 2022
           '("journal")
           nil
           "~/Denotes")
          (insert "* THOUGHTS\n\n* NOTES\n\n* CODE\n\n* TASKS\n - Remember to call:\n\n (move-todos)")))))

  (defun my-denote-archive-done-items ()
    "Archive all DONE headings and their subtrees from the current file to a yearly archive file."
    (interactive)
    (when (and buffer-file-name
               (string-match-p "__current\\.org$" buffer-file-name))
      (let* ((current-file buffer-file-name)
             (current-year (format-time-string "%Y"))
             (identifier (denote-retrieve-filename-identifier current-file))
             (archive-file (concat (file-name-directory current-file)
                                   identifier "__" current-year ".org"))
             (done-items '())
             (archive-buffer nil))

        ;; Collect all DONE items and their subtrees
        (save-excursion
          (goto-char (point-min))
          (while (re-search-forward "^\\(*+ DONE\\) " nil t)
            (let ((start (match-beginning 0))
                  (end (save-excursion
                         (org-end-of-subtree t t)
                         (point))))
              (push (list start end (buffer-substring-no-properties start end)) done-items))))

        ;; If we have DONE items, process them
        (when done-items
          ;; Create archive file if it doesn't exist
          (unless (file-exists-p archive-file)
            (with-temp-file archive-file
              (insert (denote--format-front-matter
                       (concat "Archive " current-year)
                       (current-time)
                       '("archive")
                       identifier
                       ""
                       'org))
              (insert "\n")))

          ;; Open archive file
          (setq archive-buffer (find-file-noselect archive-file))

          ;; Append DONE items to archive file
          (with-current-buffer archive-buffer
            (goto-char (point-max))
            (unless (bolp) (insert "\n"))
            (dolist (item (reverse done-items))
              (insert (nth 2 item))
              (unless (bolp) (insert "\n")))
            (save-buffer))

          ;; Remove DONE items from current file (in reverse order to maintain positions)
          (dolist (item done-items)
            (delete-region (nth 0 item) (nth 1 item)))

          (message "Archived %d DONE items to %s"
                   (length done-items)
                   (file-name-nondirectory archive-file))))))

  ;; Add to save hook for current files
  (defun my-denote-maybe-archive-on-save ()
    "Archive DONE items if saving a current.org file."
    (when (and buffer-file-name
               (string-match-p "__current\\.org$" buffer-file-name))
      (my-denote-archive-done-items)))

  (add-hook 'after-save-hook #'my-denote-maybe-archive-on-save)

  (defun my-denote-current-file ()
    "Create or find the current denote file for ongoing notes."
    (interactive)
    (let* ((current-files (directory-files denote-directory t "__current\\.org$"))
           (current-file (car current-files)))

      (if current-file
          (find-file current-file)
        ;; Create new current file
        (let ((denote-prompts '())
              (denote-use-title "Current Notes")
              (denote-use-keywords '("current"))
              (denote-use-signature "current"))
          (call-interactively #'denote)))))

  (defun my-denote-open-current-year-archive ()
    "Open the archive file for the current year."
    (interactive)
    (let* ((current-files (directory-files denote-directory t "__current\\.org$"))
           (current-file (car current-files)))

      (if current-file
          (let* ((current-year (format-time-string "%Y"))
                 (identifier (denote-retrieve-filename-identifier current-file))
                 (archive-file (concat (file-name-directory current-file)
                                       identifier "__" current-year ".org")))
            (if (file-exists-p archive-file)
                (find-file archive-file)
              (message "Archive file for %s doesn't exist yet" current-year)))
        (message "No current file found"))))

  (global-set-key (kbd "C-c d A") #'my-denote-open-current-year-archive)

  ;; extra org-mode configurations dependent on denote
  (setq org-capture-templates
        `(("n" "Note to Current File" entry
           (file ,(lambda () (my-denote-current-file-path)))
           "* NOTE %^{Task}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?"
           :prepend t)

          ("j" "Journal Entry" entry
           (file ,(lambda () (my-denote-current-file-path)))
           "* %U %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n%i"
           :prepend t)

          ("t" "Task to Current File" entry
           (file ,(lambda () (my-denote-current-file-path)))
           "* TODO %^{Task}\n:PROPERTIES:\n:CREATED: %U\n:SCHEDULE: %u\n:END:\n%?"
           :prepend t)

          ("m" "Meeting Notes" entry
           (file ,(lambda () (my-denote-current-file-path)))
           "* MEETING %? :meeting:\n  %U\n  \n** Attendees\n  - \n  \n** Agenda\n  - \n  \n** Notes\n  %i\n  \n** Action Items\n  - [ ] "
           :prepend t)))

  (defun my-denote-capture-note ()
    "Quick capture a note to current file."
    (interactive)
    (org-capture nil "n"))

  (defun my-denote-capture-task ()
    "Quick capture a task to current file."
    (interactive)
    (org-capture nil "t"))

  (defun my-denote-capture-journal ()
    "Quick capture a journal entry to current file."
    (interactive)
    (org-capture nil "j"))

  (defun my-denote-capture-meeting ()
    "Quick capture meeting notes to current file."
    (interactive)
    (org-capture nil "m"))

  ;; Keybindings
  (global-set-key (kbd "C-c d c") #'my-denote-current-file)
  (global-set-key (kbd "C-c d n") #'my-denote-capture-note)
  (global-set-key (kbd "C-c d t") #'my-denote-capture-task)
  (global-set-key (kbd "C-c d j") #'my-denote-capture-journal)
  (global-set-key (kbd "C-c d m") #'my-denote-capture-meeting)
  (global-set-key (kbd "C-c d a") #'my-denote-archive-done-items))

(provide 'rdt-org)


