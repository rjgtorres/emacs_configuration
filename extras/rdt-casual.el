(use-package rdt-casual
  :ensure nil
  :no-require t
  :defer t
  :config
  (use-package casual
    :ensure t
    :defer t)
  (use-package casual-editkit
    :bind (("C-o" . casual-editkit-main-tmenu)
           ("C-c w" . casual-editkit-windows-tmenu)
           ("C-c r" . casual-editkit-rectangle-tmenu)
           ("C-c g" . casual-editkit-registers-tmenu)
           ("C-c p" . casual-editkit-project-tmenu)))
  (use-package casual-bookmarks
    :bind (:map bookmark-bmenu-mode-map
                ("C-o" . casual-bookmarks-tmenu)
                ("J" . bookmark-jump)))
  (use-package casual-dired
    :bind
    (:map dired-mode-map
          ("C-o" . casual-dired-tmenu)
          ("s" . casual-dired-sort-by-tmenu)
          ("/" . casual-dired-search-replace-tmenu)
          ("M-o" . dired-omit-mode)
          ("E" . wdired-change-to-wdired-mode)
          ("M-n" . dired-next-dirline)
          ("M-p" . dired-prev-dirline)
          ("]" . dired-next-subdir)
          ("[" . dired-prev-subdir)
          ("<backtab>" . dired-prev-subdir)
          ("TAB" . dired-next-subdir)
          ("M-j" . dired-goto-subdir)
          (";" . image-dired-dired-toggle-marked-thumbs))
    (:map image-dired-thumbnail-mode-map
          ("n" . image-dired-display-next)
          ("p" . image-dired-display-previous))
    :hook
    (dired-mode . context-menu-mode)
    (dired-mode . dired-async-mode))
  (use-package casual-image
    :bind (:map image-mode-map
                ("C-o" . casual-image-tmenu)))
  (use-package casual-eww
    :bind
    (:map eww-mode-map
          ("C-o" . casual-eww-tmenu)
          ("C-c C-o" . eww-browse-with-external-browser)
          ("j" . shr-next-link)
          ("k" . shr-previous-link)
          ("[" . eww-previous-url)
          ("]" . eww-next-url)
          ("M-]" . eww-forward-url)
          ("M-[" . eww-back-url)
          ("n" . casual-lib-browse-forward-paragraph)
          ("p" . casual-lib-browse-backward-paragraph)
          ("P" . casual-eww-backward-paragraph-link)
          ("N" . casual-eww-forward-paragraph-link)
          ("M-l" . eww))
    (:map eww-bookmark-mode-map
          ("C-o" . casual-eww-bookmarks-tmenu)
          ("p" . previous-line)
          ("n" . next-line))))

(provide 'rdt-casual)
