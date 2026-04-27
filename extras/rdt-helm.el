(use-package rdt-helm
  :ensure nil
  :no-require t
  :config
  (use-package helm
      :ensure t
      :config
      (helm-mode t)
      (helm-autoresize-mode t)
      (helm-ff-icon-mode t)
      (setq helm-autoresize-max-height 40
            helm-autoresize-min-height 20
            helm-split-window-in-side-p t
            helm-mode-fuzzy-match t
            helm-completion-in-region-fuzzy-match t)
      :bind (([remap execute-extended-command] . 'helm-M-x)
             ([remap find-file] . 'helm-find-files)
             ([remap list-buffers] . 'helm-buffers-list)
             ([remap dabbrev-expand] . 'helm-dabbrev)
             ([remap execute-extended-command] . 'helm-M-x)
             ([remap apropos-command] . 'helm-apropos)     
             ([remap yank-pop] . 'helm-show-kill-ring)
             ([remap occur] . 'helm-occur)
             ([remap recentf] . 'helm-recentf)
             ([remap grep] . 'helm-do-grep-ag)
             ("C-x b" . helm-mini)
             ("C-x C-g" . helm-grep-do-git-grep))))

(provide 'rdt-helm)
