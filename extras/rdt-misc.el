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
    :ensure t)
  (use-package writeroom-mode
    :ensure t
    :bind(([f5] . 'writeroom-mode))
    :custom
    (writeroom-width 122))
  (use-package vterm
    :ensure t)
  )

(provide 'rdt-misc)
