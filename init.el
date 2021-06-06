

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0feb7052df6cfc1733c1087d3876c26c66410e5f1337b039be44cb406b6187c6" "8290878d9ebe107ff0263dabf4f3e2255ee206484cd35c3afb11be86b0be7bf2" default)))
 '(org-agenda-files (quote ("~/git/orgfiles/todo.org")))
 '(package-selected-packages
   (quote
    (projectile command-log-mode multiple-cursors writeroom-mode engine-mode org-superstar hl-todo company rainbow-delimiters persistent-scratch all-the-icons-dired which-key helm doom-modeline use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

  ;; Set repositories
  (require 'package)
  (setq-default
   load-prefer-newer t
   package-enable-at-startup nil)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize)

  ;; Install dependencies
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package t))
  (setq-default
   use-package-always-defer t)
(require 'org)
(org-babel-load-file "~/.emacs.d/configs/generic_config.org")
