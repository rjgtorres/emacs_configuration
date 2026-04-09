(use-package rdt-misc
  :ensure nil
  :no-require t
  :config
  (use-package doom-modeline
    :ensure t
    :init (doom-modeline-mode t))
  (use-package rainbow-delimiters
    :ensure t
    :init
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
  (use-package rainbow-mode
    :ensure t
    :defer t)
  (use-package writeroom-mode
    :ensure t
    :defer t
    :init
    (defun my/writeroom_configs ()
        (if writeroom-mode
            (progn
              (text-scale-set 1)
              (display-line-numbers-mode -1))
          (progn
              (text-scale-set 0)
              (display-line-numbers-mode 1))))
    :bind(([f5] . 'writeroom-mode))
    :custom
    (writeroom-width 80)
    (writeroom-restore-window-config t)
    :hook
    (writeroom-mode-hook . my/writeroom_configs))
  (use-package vterm
    :ensure t)
  )

(provide 'rdt-misc)
