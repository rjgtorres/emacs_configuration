

;;;-----------------------------------------------------------------------------
;;; Modifications mail (ver sc-mail.el)
;;;-----------------------------------------------------------------------------
(setq user-full-name "Ricardo Torres")
(setq user-mail-address "rtorres@siscog.pt")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/git/orgfiles/todo.org")))
 '(package-selected-packages
   (quote
    (persistent-scratch which-key diminish magit helm-spotify-plus helm use-package autopair writeroom-mode engine-mode all-the-icons org-superstar centaur-tabs rainbow-delimiters powerline auto-complete))))
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
(org-babel-load-file "~/.emacs.d/torresconfig.org")
