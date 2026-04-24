;; -*- lexical-binding: t; -*-


(use-package package
  :config
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/"))
  (package-initialize))

(use-package use-package
  :custom
  (package-native-compile t)
  (warning-minimum-level :emergency))

(use-package emacs
  :ensure nil
  :bind                      ; NOTE: M-x describe-personal-bindings (for all use-packge binds)
  ("M-j" . duplicate-dwim)
  ("M-g r" . recentf)
  ("M-s g" . grep)
  ("C-x ;" . comment-line)
  ("M-s f" . find-name-dired)
  ("C-x p l". project-list-buffers)
  ("C-x w t"  . window-layout-transpose)            ; EMACS-31
  ("C-x w r"  . window-layout-rotate-clockwise)     ; EMACS-31
  ("C-x w f h"  . window-layout-flip-leftright)     ; EMACS-31
  ("C-x w f v"  . window-layout-flip-topdown)       ; EMACS-31
  ("C-x 5 l"  . select-frame-by-name)
  ("C-x 5 s"  . set-frame-name)
  ("RET" . newline-and-indent)
  ("C-z" . nil)
  ("C-x C-z" . nil)
  ("C-M-z" . delete-pair)
  ("C-x C-k RET" . nil)
  ("C-x C-<up>" . windmove-up)
  ("C-x C-<down>" . windmove-down)
  ("C-x C-<left>" . windmove-left)
  ("C-x C-<right>" . windmove-right)
  ("C-q" . kill-current-buffer)
  :custom
  (ad-redefinition-action 'accept)
  (auto-save-default t)
  (bookmark-file (expand-file-name "cache/bookmarks" user-emacs-directory))
  (shared-game-score-directory (expand-file-name "cache/games/" user-emacs-directory)) ; FIXME: is this even working?
  (calendar-latitude 38.791247)                   ;; These are needed
  (calendar-longitude -9.179184)                 ;; for M-x `sunrise-sunset'
  (calendar-location-name "Lisbon, PT")
  (column-number-mode t)
  (line-number-mode t)
  (line-spacing nil)
  (completion-ignore-case t)
  (completions-detailed t)
  (doc-view-resolution 200)
  (delete-by-moving-to-trash t)
  (delete-pair-blink-delay 0)
  (delete-pair-push-mark t)                   ; EMACS-31 for easy subsequent C-x C-x
  (display-line-numbers-width 3)
  (display-line-numbers-widen t)
  (display-fill-column-indicator-warning nil) ; EMACS-31
  (delete-selection-mode t)
  (enable-recursive minibuffers t)
  (find-ls-option '("-exec ls -ldh {} +" . "-ldh"))  ; find-dired results with human readable sizes
  (frame-resize-pixelwise t)
  (global-goto-address-mode t)                            ;     C-c RET on URLs open in default browser
  (global-hl-line-mode t)
  (global-visual-line-mode t)
  (help-window-select t)
  (highlight-nonselected-windows nil)
  (history-length 800)
  (inhibit-startup-message t)
  (ibuffer-human-readable-size t) ; EMACS-31
  (ielm-history-file-name (expand-file-name "cache/ielm-history.eld" user-emacs-directory)) ; EMACS-31
  (kill-do-not-save-duplicates t)
  (kill-region-dwim 'emacs-word)  ; EMACS-31
  (create-lockfiles nil)   ; No lock files
  (make-backup-files nil)  ; No backup files
  (multisession-directory (expand-file-name "cache/multisession/" user-emacs-directory))
  (native-comp-async-on-battery-power t)  ; No compilations when on battery EMACS-31
  (pixel-scroll-precision-mode t)
  (pixel-scroll-precision-use-momentum nil)
  (project-list-file (expand-file-name "cache/projects" user-emacs-directory))
  (project-vc-extra-root-markers '("Cargo.toml" "package.json" "go.mod")) ; Excelent for mono repos with multiple langs, makes Eglot happy
  (ring-bell-function 'ignore)
  (read-answer-short t)
  (recentf-max-saved-items 300) ; default is 20
  (recentf-max-menu-items 15)
  (recentf-auto-cleanup (if (daemonp) 300 'never))
  (recentf-exclude (list "^/\\|su\\|sudo\\)?:"))
  (recentf-save-file (expand-file-name "cache/recentf" user-emacs-directory))
  (redisplay-skip-fontification-on-input t)
  (register-use-preview t)
  (remote-file-name-inhibit-delete-by-moving-to-trash t)
  (remote-file-name-inhibit-auto-save t)
  (remote-file-name-inhibit-locks t)
  (remote-file-name-inhibit-auto-save-visited t)
  (tramp-copy-size-limit (* 2 1024 1024)) ;; 2MB
  (tramp-use-scp-direct-remote-copying t)
  (tramp-verbose 2)
  (resize-mini-windows 'grow-only)
  (save-interprogram-paste-before-kill t)
  (scroll-conservatively 8)
  (scroll-margin 5)
  (set-mark-command-repeat-pop t) ; So we can use C-u C-SPC C-SPC C-SPC... instead of C-u C-SPC C-u C-SPC...
  (split-width-threshold 170)     ; So vertical splits are preferred
  (split-height-threshold nil)
  (shr-use-colors nil)
  (switch-to-buffer-obey-display-actions t)
  (tab-always-indent 'complete)
  (tab-width 4)
  (transient-history-file (expand-file-name "cache/transient/history.el" user-emacs-directory))
  (transient-levels-file (expand-file-name "cache/transient/levels.el" user-emacs-directory))
  (transient-values-file (expand-file-name "cache/transient/values.el" user-emacs-directory))
  (treesit-font-lock-level 4)
  (treesit-auto-install-grammar t) ; EMACS-31
  (treesit-enabled-modes t)        ; EMACS-31
  (truncate-lines t)
  (undo-limit (* 13 160000))
  (undo-strong-limit (* 13 240000))
  (undo-outer-limit (* 13 24000000))
  (url-configuration-directory (expand-file-name "cache/url/" user-emacs-directory))
  (use-dialog-box nil)
  (use-file-dialog nil)
  (use-package-hook-name-suffix nil)
  (use-short-answers t)
  (visible-bell nil)
  (window-combination-resize t)
  (window-resize-pixelwise nil)
  (xref-search-program 'ripgrep)        ; TODO: make it dinamic check if ripgrep is available before setting it and if it costs too much of the init time
  (zone-all-frames t)            ; EMACS-31
  (zone-all-windows-in-frame t)  ; EMACS-31
  (zone-programs '[zone-pgm-rat-race])
  (grep-command "rg -nS --no-heading ") ; TODO: make it dinamic check if ripgrep is available before setting it and if it costs too much of the init time
  (grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".jj" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "node_modules" "build" "dist" "target"))

  ;; session
  (savehist-save-minibuffer-history t)    ; t is default
  (savehist-additional-variables
   '(kill-ring                            ; clipboard
     register-alist                       ; macros
     mark-ring global-mark-ring           ; marks
     search-ring regexp-search-ring))     ; searches
  (savehist-file (expand-file-name "cache/session/history" user-emacs-directory))
  (save-place-file (expand-file-name "cache/session/saveplace" user-emacs-directory))
  (save-place-limit 600)

  (desktop-save t)
  (desktop-load-locked-desktop t)
  (desktop-path (list (expand-file-name "cache/session" user-emacs-directory)))
  (desktop-dirname (expand-file-name "cache/session/" user-emacs-directory))
  (desktop-base-file-name ".desktop")
  (desktop-base-lock-name ".desktop.lock")
  :config
  (global-set-key (kbd "M-<down>") (kbd "C-u 2 C-v"))
  (global-set-key (kbd "M-<up>") (kbd "C-u 2 M-v"))
  (setq show-paren-delay 0)
  (setq-default cursor-type 'bar)
  (setq-default cursor-in-non-selected-windows nil)

  (setf display-time-24hr-format t)
  (display-time-mode t)
  (setq-default frame-title-format '((:eval (format-time-string "%H:%M %A %d %B")) " - %b [%m]"))
  (fringe-mode 0)
  (setq-default indent-tabs-mode nil)
  (put 'dired-find-alternate-file 'disabled nil)
  (electric-pair-mode t)
  ;; Save manual customizations to other file than init.el
  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)

  ;; Makes everything accept utf-8 as default, so buffers with tsx and so
  ;; won't ask for encoding (because undecided-unix) every single keystroke
  (modify-coding-system-alist 'file "" 'utf-8)

  (setq-default bidi-display-reordering 'left-to-right)
  (setq-default bidi-paragraph-direction 'left-to-right)
  (setq bidi-inhibit-bpa t)

  ;; We want auto-save, but no #file# cluterring, so everything goes under our config cache/
  (make-directory (expand-file-name "cache/auto-saves/" user-emacs-directory) t)
  (setq auto-save-list-file-prefix (expand-file-name "cache/auto-saves/sessions/" user-emacs-directory)
        auto-save-file-name-transforms `((".*" ,(expand-file-name "cache/auto-saves/" user-emacs-directory) t)))

  ;; For OSC 52 compatible terminals support
  (defvar xterm-extra-capabilities)
  (setq xterm-extra-capabilities '(getSelection setSelection modifyOtherKeys))

  ;; TERMs should use the entire window space
  (declare-function emacs-solo/disable-global-scrolling-in-ansi-term "")
  (defun emacs-solo/disable-global-scrolling-in-ansi-term ()
    "Disable global scrolling behavior in ansi-term buffers."
    (setq-local scroll-conservatively 101)
    (setq-local scroll-margin 0)
    (setq-local scroll-step 0))
  (add-hook 'term-mode-hook #'emacs-solo/disable-global-scrolling-in-ansi-term)

  ;; TRAMP specific HACKs
  ;; See https://coredumped.dev/2025/06/18/making-tramp-go-brrrr./
  (connection-local-set-profile-variables
   'remote-direct-async-process
   '((tramp-direct-async-process . t)))

  (connection-local-set-profiles
   '(:application tramp :protocol "scp")
   'remote-direct-async-process)

  (declare-function tramp-compile-disable-ssh-controlmaster-options "")
  (with-eval-after-load 'tramp
    (with-eval-after-load 'compile
      (remove-hook 'compilation-mode-hook #'tramp-compile-disable-ssh-controlmaster-options)))

  (setopt tramp-persistency-file-name (expand-file-name "cache/tramp" user-emacs-directory))
  ;; Set line-number-mode with relative numbering
  (setq display-line-numbers-type 'relative)
  (add-hook 'prog-mode-hook #'display-line-numbers-mode)
  ;; (add-hook 'text-mode-hook #'display-line-numbers-mode)

  ;; Starts `completion-preview-mode' automatically in some modes
  (add-hook 'prog-mode-hook #'completion-preview-mode)
  (add-hook 'text-mode-hook #'completion-preview-mode)
  (add-hook 'rcirc-mode-hook #'completion-preview-mode)
  (add-hook 'erc-mode-hook #'completion-preview-mode)

  ;; A Protesilaos life savier HACK
  ;; Add option "d" to whenever using C-x s or C-x C-c, allowing a quick preview
  ;; of the diff (if you choose `d') of what you're asked to save.
  (add-to-list 'save-some-buffers-action-alist
               (list "d"
                     (lambda (buffer) (diff-buffer-with-file (buffer-file-name buffer)))
                     "show diff between the buffer and its file"))

  ;; On Terminal: changes the vertical separator to a full vertical line
  ;;              and truncation symbol to a right arrow
  (set-display-table-slot standard-display-table 'vertical-border ?\u2502)
  (set-display-table-slot standard-display-table 'truncation ?\u2192)

  ;; Ibuffer filters
  (setq ibuffer-saved-filter-groups
        '(("default"
           ("org"     (or
                       (mode . org-mode)
                       (name . "^\\*Org Src")
                       (name . "^\\*Org Agenda\\*$")))
           ("tramp"   (name . "^\\*tramp.*"))
           ("emacs"   (or
                       (name . "^\\*scratch\\*$")
                       (name . "^\\*Messages\\*$")
                       (name . "^\\*Warnings\\*$")
                       (name . "^\\*Shell Command Output\\*$")
                       (name . "^\\*Async-native-compile-log\\*$")))
           ("ediff"   (name . "^\\*[Ee]diff.*"))
           ("vc"      (name . "^\\*vc-.*"))
           ("dired"   (mode . dired-mode))
           ("terminal" (or
                        (mode . term-mode)
                        (mode . shell-mode)
                        (mode . eshell-mode)))
           ("help"    (or
                       (name . "^\\*Help\\*$")
                       (name . "^\\*info\\*$")))
           ("news"    (name . "^\\*Newsticker.*"))
           ("gnus"    (or
                       (mode . message-mode)
                       (mode . gnus-group-mode)
                       (mode . gnus-summary-mode)
                       (mode . gnus-article-mode)
                       (name . "^\\*Group\\*")
                       (name . "^\\*Summary\\*")
                       (name . "^\\*Article\\*")
                       (name . "^\\*BBDB\\*")))
           ("chat"    (or
                       (mode . rcirc-mode)
                       (mode . erc-mode)
                       (name . "^\\*rcirc.*")
                       (name . "^\\*ERC.*"))))))

  (add-hook 'ibuffer-mode-hook
            (lambda ()
              (ibuffer-switch-to-saved-filter-groups "default")))
  (setq ibuffer-show-empty-filter-groups nil) ; don't show empty groups


  (defun emacs-solo/filtered-project-buffer-completer (project files-only)
    "A function that filters special buffers and uses `completing-read`."
    (let* ((project-buffers (project-buffers project))
           (filtered-buffers
            (cl-remove-if
             (lambda (buffer)
               (let* ((name (buffer-name buffer))
                      (trimmed-name (string-trim name)))
                 (or
                  (and (> (length trimmed-name) 1)
                       (string-prefix-p "*" trimmed-name)
                       (string-suffix-p "*" trimmed-name))
                  (and files-only (not (buffer-file-name buffer))))))
             project-buffers)))

      (if filtered-buffers
          (let* ((buffer-names (mapcar #'buffer-name filtered-buffers))
                 (selection (completing-read "Switch to project buffer: " buffer-names nil t)))
            (when selection
              (switch-to-buffer selection)))
        (message "No suitable project buffers to switch to."))))
  ;; Tell project.el filter out *special buffers* on `C-x p C-b'
  (setq project-buffers-viewer 'emacs-solo/filtered-project-buffer-completer)


  ;; So eshell git commands open an instance of THIS config of Emacs
  (setenv "GIT_EDITOR" (format "emacs --init-dir=%s " (shell-quote-argument user-emacs-directory)))
  (setenv "JJ_EDITOR" (format "emacs --init-dir=%s " (shell-quote-argument user-emacs-directory)))
  (setenv "EDITOR" (format "emacs --init-dir=%s " (shell-quote-argument user-emacs-directory)))
  (setenv "PAGER" "cat")
  ;; So rebase from eshell opens with a bit of syntax highlight
  (add-to-list 'auto-mode-alist '("/git-rebase-todo\\'" . conf-mode))

  ;; Mute NPM loglevel so it wont interfer with other issued commands like grep
  (setenv "NPM_CONFIG_LOGLEVEL" "silent")

  ;; Makes any xref buffer "exportable" to a grep buffer with "E" so you can edit it with "e".
  (defun emacs-solo/xref-to-grep-compilation ()
    "Export the current Xref results to a grep-like buffer (Emacs 30+)."
    (interactive)
    (unless (derived-mode-p 'xref--xref-buffer-mode)
      (user-error "Not in an Xref buffer"))

    (let* ((items (and (boundp 'xref--fetcher)
                       (funcall xref--fetcher)))
           (buf-name "*xref→grep*")
           (grep-buf (get-buffer-create buf-name)))
      (unless items
        (user-error "No xref items found"))

      (with-current-buffer grep-buf
        (let ((inhibit-read-only t))
          (erase-buffer)
          (insert (format "-*- mode: grep; default-directory: %S -*-\n\n"
                          default-directory))
          (dolist (item items)
            (let* ((loc (xref-item-location item))
                   (file (xref-file-location-file loc))
                   (line (xref-file-location-line loc))
                   (summary (xref-item-summary item)))
              (insert (format "%s:%d:%s\n" file line summary)))))
        (grep-mode))
      (pop-to-buffer grep-buf)))
  (with-eval-after-load 'xref
    (define-key xref--xref-buffer-mode-map (kbd "E")
                #'emacs-solo/xref-to-grep-compilation))

  ;; ELISP evaluations show results in an overlay
  (defun emacs-solo/eval-last-sexp-overlay (arg)
    "Eval last sexp and show result inline as overlay.
With prefix ARG, insert the result inline instead.
Use ⇒ if displayable, otherwise fallback to =>."
    (interactive "P")
    (let ((arrow (if (char-displayable-p ?⇒) " ; ⇒ " " ; => ")))
      (if arg
          (let ((value (elisp--eval-last-sexp nil)))
            (insert arrow (format "%S" value)))
        (let* ((value (elisp--eval-last-sexp nil))
               (str (concat arrow (format "%S" value)))
               (ov (make-overlay (point) (point))))
          (overlay-put ov 'after-string
                       (propertize str 'face 'font-lock-comment-face))
          (run-with-timer
           3 nil
           (lambda (o) (delete-overlay o))
           ov)))))
  (global-set-key (kbd "C-x C-e") #'emacs-solo/eval-last-sexp-overlay)

  ;; Runs 'private.el' after Emacs inits
  (add-hook 'after-init-hook
            (lambda ()
              (let ((private-file (expand-file-name "private.el" user-emacs-directory)))
                (when (file-exists-p private-file)
                  (load private-file)))))

  :init
;;   ;; Keep margins from automatic resizing
;;   (defun emacs-solo/set-default-window-margins ()
;;     "Set default left and right margins for all windows.
;; Unless the buffer uses `emacs-solo/center-document-mode`
;; or is an ERC buffer."
;;     (interactive)
;;     (dolist (window (window-list))
;;       (with-current-buffer (window-buffer window)
;;         (unless (or (bound-and-true-p emacs-solo/center-document-mode)
;;                     (derived-mode-p 'erc-mode))
;;           (set-window-margins window 2 0))))) ;; (LEFT RIGHT)

;;   (add-hook 'window-configuration-change-hook #'emacs-solo/set-default-window-margins)

  (when (>= emacs-major-version 31)
    (tty-tip-mode nil))   ;; EMACS-31
  (tooltip-mode nil)

  (select-frame-set-input-focus (selected-frame))
  (blink-cursor-mode 0)
  (recentf-mode 1)
  (repeat-mode 1)
  (desktop-save-mode 1)
  (savehist-mode 1)
  (save-place-mode 1)
  (winner-mode)
  (xterm-mouse-mode 1)
  (file-name-shadow-mode 1) ; allows us to type a new path without having to delete the current one
  )

  ;; FONT configuration
  ;; this fonts need to be installed, copy them to ~/.local/share/fonts
  (defvar my/variable-width-font "Source Serif Pro"
    "The font to use for variable-pitch (document) text.")
  (defvar my/fixed-width-font "Iosevka Term Slab Md Ex"
    "The font to use for variable-pitch (document) text.")

  ;; (set-face-attribute 'default nil :font my/fixed-width-font :weight 'medium :height 110)
  ;; (set-face-attribute 'fixed-pitch nil :font my/fixed-width-font :weight 'medium :height 110)
  ;; (set-face-attribute 'variable-pitch nil :font my/variable-width-font :weight 'medium :height 1.2)
  ;; (add-hook 'text-mode-hook 'variable-pitch-mode)

(defun my/set-fonts ()
  (interactive)
  ;; Set font based on existing ones
  (set-face-attribute 'default nil :font my/fixed-width-font :weight 'medium :height 110)
  (set-face-attribute 'fixed-pitch nil :font my/fixed-width-font :weight 'medium :height 110)
  (set-face-attribute 'variable-pitch nil :font my/variable-width-font :weight 'medium :height 1.2)
  (add-hook 'text-mode-hook 'variable-pitch-mode))

(add-hook 'after-init-hook #'my/set-fonts)
(add-hook 'server-after-make-frame-hook #'my/set-fonts)

(use-package compile
  :ensure nil
  :custom
  (compilation-always-kill t)
  (compilation-scroll-output t)
  (ansi-color-for-compilation-mode t)
  :config
  (add-hook 'compilation-filter-hook #'ansi-color-compilation-filter))

(use-package window
  :ensure nil
  :custom
  (display-buffer-alist
   '(("\\*\\(Backtrace\\|Warnings\\|Compile-Log\\|Messages\\|Bookmark List\\|Occur\\|eldoc\\)\\*"
      (display-buffer-in-side-window)
      (window-height . 0.25)
      (side . bottom)
      (slot . 0))
     ("\\*\\([Hh]elp\\)\\*"
      (display-buffer-in-side-window)
      (window-width . 75)
      (side . right)
      (slot . 0))
     ("\\*\\(Ibuffer\\)\\*"
      (display-buffer-in-side-window)
      (window-width . 100)
      (side . right)
      (slot . 1))
     ("\\*\\(Flymake diagnostics\\|Completions\\)"
      (display-buffer-in-side-window)
      (window-height . 0.25)
      (side . bottom)
      (slot . 2))
     ("\\*\\(grep\\|xref\\|find\\)\\*"
      (display-buffer-in-side-window)
      (window-height . 0.25)
      (side . bottom)
      (slot . 1))
     ("\\*\\(M3U Playlist\\)"
      (display-buffer-in-side-window)
      (window-height . 0.25)
      (side . bottom)
      (slot . 3)))))

;;; │ DIFF
(use-package diff-mode
  :ensure nil
  :defer t
  :bind (:map diff-mode-map
              ("M-o" . other-window))
  :config
  (setq diff-default-read-only t)
  (setq diff-advance-after-apply-hunk t)
  (setq diff-update-on-the-fly t)
  (setq diff-font-lock-syntax 'hunk-also)
  (setq diff-font-lock-prettify nil))

;;; │ EDIFF
(use-package ediff
  :ensure nil
  :commands (ediff-buffers ediff-files ediff-buffers3 ediff-files3)
  :init
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  :config
  (setq ediff-keep-variants nil)
  (setq ediff-make-buffers-readonly-at-startup nil)
  (setq ediff-show-clashes-only t))

(use-package which-key
  :defer t
  :ensure nil
  :hook
  (after-init-hook . which-key-mode)
  :config
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "… ")
  (setq which-key-max-display-columns 4)
  (setq which-key-idle-delay 1)
  (setq which-key-idle-secondary-delay 0.25)
  (setq which-key-add-column-padding 1)
  (setq which-key-max-description-length 40)

  ;; Inspired by: https://gist.github.com/mmarshall540/a12f95ab25b1941244c759b1da24296d
  ;;
  ;; By default, Which-key doesn't give much help for prefix-keys. It
  ;; either shows the generic description, "+prefix", or the name of a
  ;; prefix-command, which usually isn't as descriptive as we'd like.
  ;;
  ;; Here are some descriptions for the default bindings in `global-map'
  ;; and `org-mode-map'.
  (which-key-add-key-based-replacements
    "<f1> 4" "help-other-win"
    "<f1>" "help"
    "<f2>" "2column"
    "C-c" "mode-and-user"
    "C-c !" "flymake"
    "C-c g" "git-gutter"
    "C-h 4" "help-other-win"
    "C-h" "help"
    "C-x 4" "other-window"
    "C-x 5" "other-frame"
    "C-x 6" "2-column"
    "C-x 8" "insert-special"
    "C-x 8 ^" "superscript (⁰, ¹, ², …)"
    "C-x 8 _" "subscript (₀, ₁, ₂, …)"
    "C-x 8 a" "arrows & æ (←, →, ↔, æ)"
    "C-x 8 e" "emojis (🫎, 🇧🇷, 🇮🇹, …)"
    "C-x 8 *" "common symbols ( , ¡, €, …)"
    "C-x 8 =" "macron (Ā, Ē, Ḡ, …)"
    "C-x 8 N" "macron (№)"
    "C-x 8 O" "macron (œ)"
    "C-x 8 ~" "tilde (~, ã, …)"
    "C-x 8 /" "stroke (÷, ≠, ø, …)"
    "C-x 8 ." "dot (·, ż)"
    "C-x 8 ," "cedilla (¸, ç, ą, …)"
    "C-x 8 '" "acute (á, é, í, …)"
    "C-x 8 `" "grave (à, è, ì, …)"
    "C-x 8 \"" "quotation/dieresis (\", ë, ß, …)"
    "C-x 8 1" "†, 1/…"
    "C-x 8 2" "‡"
    "C-x 8 3" "3/…"
    "C-x C-k C-q" "kmacro-counters"
    "C-x C-k C-r a" "kmacro-add"
    "C-x C-k C-r" "kmacro-register"
    "C-x C-k" "keyboard-macros"
    "C-x RET" "encoding/input"
    "C-x a i" "abbrevs-inverse-add"
    "C-x a" "abbrevs"
    "C-x n" "narrowing"
    "C-x p" "projects"
    "C-x r" "reg/rect/bkmks"
    "C-x t ^" "tab-bar-detach"
    "C-x t" "tab-bar"
    "C-x v M" "vc-mergebase"
    "C-x v b" "vc-branch"
    "C-x v" "version-control"
    "C-x w ^" "window-detach"
    "C-x w" "window-extras"
    "C-x x" "buffer-extras"
    "C-x" "extra-commands"
    "M-g" "goto-map"
    "M-s h" "search-highlight"
    "M-s" "search-map")

  ;; Upon loading, the built-in `page-ext' package turns "C-x C-p" into
  ;; a prefix-key. If you know of other built-in packages that have
  ;; this behavior, please let me know, so I can add them.
  (with-eval-after-load 'page-ext
    (which-key-add-key-based-replacements
      "C-x C-p" "page-extras"))

  ;; Org-mode provides some additional prefix-keys in `org-mode-map'.
  (with-eval-after-load 'org
    (which-key-add-keymap-based-replacements org-mode-map
      "C-c \"" "org-plot"
      "C-c C-v" "org-babel"
      "C-c C-x" "org-extra-commands")))

(use-package treesit
  :when (and (fboundp 'treesit-available-p)
             (treesit-available-p))
  :config (setq treesit-font-lock-level 4)
  :init
  (setq treesit-language-source-alist
        '((bash       . ("https://github.com/tree-sitter/tree-sitter-bash"))
          (c          . ("https://github.com/tree-sitter/tree-sitter-c"))
          (cpp        . ("https://github.com/tree-sitter/tree-sitter-cpp"))
          (css        . ("https://github.com/tree-sitter/tree-sitter-css"))
          (cmake      . ("https://github.com/uyha/tree-sitter-cmake"))
          (csharp     . ("https://github.com/tree-sitter/tree-sitter-c-sharp.git"))
          (dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile"))
          (elisp      . ("https://github.com/Wilfred/tree-sitter-elisp"))
          (f90        . ("https://github.com/stadelmanma/tree-sitter-fortran"))
          (html       . ("https://github.com/tree-sitter/tree-sitter-html"))
          (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
          (json       . ("https://github.com/tree-sitter/tree-sitter-json"))
          (make       . ("https://github.com/alemuller/tree-sitter-make"))
          (markdown   . ("https://github.com/MDeiml/tree-sitter-markdown" nil "tree-sitter-markdown/src"))
          (org        . ("https://github.com/milisims/tree-sitter-org"))
          (python     . ("https://github.com/tree-sitter/tree-sitter-python"))
          (ruby       . ("https://github.com/tree-sitter/tree-sitter-ruby"))
          (yaml       . ("https://github.com/ikatyang/tree-sitter-yaml"))
          (toml       . ("https://github.com/tree-sitter/tree-sitter-toml")))))
(add-to-list 'major-mode-remap-alist '(sh-mode         . bash-ts-mode))
(add-to-list 'major-mode-remap-alist '(c-mode          . c-ts-mode))
(add-to-list 'major-mode-remap-alist '(c++-mode        . c++-ts-mode))
(add-to-list 'major-mode-remap-alist '(c-or-c++-mode   . c-or-c++-ts-mode))
(add-to-list 'major-mode-remap-alist '(css-mode        . css-ts-mode))
(add-to-list 'major-mode-remap-alist '(js-mode         . js-ts-mode))
(add-to-list 'major-mode-remap-alist '(fortran-mode    . f90-ts-mode))
(add-to-list 'major-mode-remap-alist '(js-json-mode    . json-ts-mode))
(add-to-list 'major-mode-remap-alist '(makefile-mode   . cmake-ts-mode))
(add-to-list 'major-mode-remap-alist '(python-mode     . python-ts-mode))
(add-to-list 'major-mode-remap-alist '(ruby-mode       . ruby-ts-mode))
(add-to-list 'major-mode-remap-alist '(conf-toml-mode  . toml-ts-mode))

;;; │ Pretty symbols
(defun my-add-pretty-list ()
  "make some word or string show as pretty unicode symbols"
  (mapc (lambda (pair) (push pair prettify-symbols-alist))
        '(
          ("lambda" . 955)
          ("->" . 8594)
          ("=>" . 8658)
          ("<=" . 8804)
          (">=" . 8805)
          ("sqrt" . 8730)
          ("alpha" . 945)
          ("beta" . 946)
          ("delta" . 916)
          ("omega" . 937)
          ("phi" . 969)
          ("pi" . 960)
          ("psi" . 936)
          ("theta" . 952)
          ("sum" . 8721))))
(add-hook 'prog-mode-hook 'my-add-pretty-list)
(add-hook 'org-mode-hook 'my-add-pretty-list)
(global-prettify-symbols-mode +1)


;;; │ FLYSPELL
;; needs aspell in the system and the dictionaries
(use-package flyspell
  :ensure nil
  :defer t
  :init
  (setq ispell-program-name "hunspell"
        ispell-extra-args '("--sug-mode=ultra"))
  :config
  (setq ispell-dictionary "en_GB,pt_PT")
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_GB,pt_PT")
  (setq ispell-personal-dictionary "~/.hunspell_personal")
  (unless (file-exists-p ispell-personal-dictionary)
    (write-region "" nil ispell-personal-dictionary nil 0)))

;;
;;  A nice resource about it: https://www.rahuljuliato.com/posts/abbrev-mode
(use-package abbrev
  :ensure nil
  :init
  ;; hook abbrev mode to the modes
  (dolist (hook '(f90-ts-mode-hook
                  c++-ts--mode-hook
                  org-mode-hook
                  markdown-mode-hook))
    (add-hook hook #'abbrev-mode))
  :custom
  (save-abbrevs nil)
  :config
  (defun emacs-solo/abbrev--replace-placeholders ()
    "Replace placeholders ###1###, ###2###, ... with minibuffer input.
If ###@### is found, remove it and place point there at the end."
    (let ((cursor-pos nil)) ;; to store where to place point
      (save-excursion
        (goto-char (point-min))
        (let ((loop 0)
              (values (make-hash-table :test 'equal)))
          (while (re-search-forward "###\\([0-9]+\\|@\\)###" nil t)
            (setq loop (1+ loop))
            (let* ((index (match-string 1))
                   (start (match-beginning 0))
                   (end (match-end 0)))
              (cond
               ((string= index "@")
                (setq cursor-pos start)
                (delete-region start end))
               (t
                (let* ((key (format "###%s###" index))
                       (val (or (gethash key values)
                                (let ((input (read-string (format "Value for %s: " key))))
                                  (puthash key input values)
                                  input))))
                  (goto-char start)
                  (delete-region start end)
                  (insert val)
                  (goto-char (+ start (length val))))))))))
      (when cursor-pos
        (goto-char cursor-pos))))

  ;; define the abbreviation tables
  (define-abbrev-table 'global-abbrev-table
    '(
      ;; emojis
      ("mysmile" "😀")
      ("mykiss" "😘")
      ("mypoop" "💩")
      ("mypalm" "🤦‍♂️")
      ("mygrump" "😠")
      
      ;; NerdFonts
      ("nerdfolder" "")
      ("nerdgit" "")
      ("nerdemacs" "")
      ))

  (define-abbrev-table 'f90-ts-mode-abbrev-table
    '(("p" "print*,")))

  (define-abbrev-table 'c++-ts-mode-abbrev-table
    '(("cout" "std::cout << \"###1###\" + \"\\n\";" emacs-solo/abbrev--replace-placeholders)
      ("incio" "#include <iostream>")))
  
  (define-abbrev-table 'org-mode-abbrev-table
    '(("ocb" "#+BEGIN_SRC @\n\n#+END_SRC"
       (lambda () (search-backward "@") (delete-char 1)))
      ("oheader" "#+TITLE: ###1###\n#+AUTHOR: ###2###\n#+EMAIL: ###3###\n#+OPTIONS: toc:nil\n"
       emacs-solo/abbrev--replace-placeholders)))

  (define-abbrev-table 'markdown-mode-abbrev-table
    '(("cb" "```@\n\n```"
       (lambda () (search-backward "@") (delete-char 1))))))

;; eww configs
(use-package browser
  :ensure nil
  :config
  (defun my-browse-url-mpv (url &rest _args)
    "Open URL in mpv."
    (start-process "mpv" nil "mpv" url))

  (defun my-browse-url-pdf (url &rest _args)
    "Fetch remote PDF and open in pdf-tools within Emacs."
    (let ((tmp (make-temp-file "emacs-pdf-" nil ".pdf")))
      (url-copy-file url tmp t)
      (find-file-other-window tmp)
      (pdf-view-mode)))
  (defun my/eww-download-image-at-point ()
    "Download image at point to `eww-download-directory'."
    (interactive)
    (let ((url (or (get-text-property (point) 'image-url)
                   (get-text-property (point) 'shr-url))))
      (if (not url)
          (message "No image at point")
        (let* ((filename (file-name-nondirectory (url-filename (url-generic-parse-url url))))
               (dest (expand-file-name filename eww-download-directory)))
          (url-copy-file url dest t)
          (message "Saved: %s" dest)))))
  :custom
  (eww-download-directory (expand-file-name "~/Downloads/"))

  (browse-url-handlers
   '(("\\(youtube\\.com\\|youtu\\.be\\|vimeo\\.com\\|twitch\\.tv\\)" . my-browse-url-mpv)
     ("\\.mp4$" . my-browse-url-mpv)
     ("\\.pdf$" . my-browse-url-pdf)
     ("." . eww-browse-url)))

  ;; Keep your fallback setting
  (browse-url-secondary-browser-function 'browse-url-generic)
  (browse-url-generic-program "firefox")

  ;; (shr-width 100)
  ;; (shr-max-width 120)
  ;; (shr-indentation 4)

  ;; (shr-use-fonts nil)
  ;; (shr-max-image-size '(800 . 600))
  (shr-image-animate t)
  :bind (:map
         eww-mode-map
         ("=" text-scale-increase)
         ("-" text-scale-decrease)
         ("0" text-scale-adjust)
         ("U" shr-copy-url)
         ("I" my/eww-download-image-at-point)))

(use-package image
  :ensure nil
  :custom
  ;; Enable converting external formats (ie. webp) to internal ones.
  (image-use-external-converter t))

;;; │ Theme
(message "loading theme")
(add-to-list 'custom-theme-load-path (expand-file-name "moe-theme.el" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "moe-theme.el" user-emacs-directory))
(use-package moe-theme
  :ensure nil
  :config
  (use-package moe-theme-flavours
    :ensure nil
    :config
    (moe-theme-flavour-darkmate)
    (moe-theme-apply-color 'g/b)))

(add-to-list 'load-path (expand-file-name "extras" user-emacs-directory))
(require 'emacs-solo-exec-path-from-shell)
(require 'rdt-persistent-scratch)
(require 'rdt-icons)
(require 'rdt-magit)
(require 'rdt-helm)
(require 'rdt-casual)
(require 'rdt-org)
(require 'rdt-lsp)
(require 'rdt-flycheck)
(require 'rdt-completions)
(require 'rdt-ai)
(require 'rdt-common-lisp)
(require 'rdt-misc)
(require 'rdt-search-engines)
(require 'rdt-media)
(require 'emacs-solo-yt)
(require 'emacs-solo-weather)
(require 'emacs-solo-m3u)
(require 'rdt-rand-elisp)

(message (emacs-init-time))


;; todo remove this:

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes
;;    (quote
;;     ("0feb7052df6cfc1733c1087d3876c26c66410e5f1337b039be44cb406b6187c6" "8290878d9ebe107ff0263dabf4f3e2255ee206484cd35c3afb11be86b0be7bf2" default)))
;;  '(org-agenda-files (quote ("~/git/orgfiles/todo.org")))
;;  '(package-selected-packages
;;    (quote
;;     (projectile command-log-mode multiple-cursors writeroom-mode engine-mode org-superstar hl-todo company rainbow-delimiters persistent-scratch all-the-icons-dired helm doom-modeline))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

;;   ;; Set repositories
;;   (require 'package)
;;   (setq-default
;;    load-prefer-newer t
;;    package-enable-at-startup nil)
;;   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;   (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;;   (package-initialize)

;;   ;; Install dependencies
;;   (unless (package-installed-p 'use-package)
;;     (package-refresh-contents)
;;     (package-install 'use-package t))
;;   (setq-default
;;    use-package-always-defer t)
;; bootstrap straight
;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;;        (expand-file-name
;;         "straight/repos/straight.el/bootstrap.el"
;;         (or (bound-and-true-p straight-base-dir)
;;             user-emacs-directory)))
;;       (bootstrap-version 7))
;;   (unless (file-exists-p bootstrap-file)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
;;          'silent 'inhibit-cookies)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   (load bootstrap-file nil 'nomessage))

;; add use-package to use with straight
;; (straight-use-package 'use-package)
;; (straight-use-package 'org)
;; (org-babel-load-file "~/.emacs.d/configs/generic_config.org")

