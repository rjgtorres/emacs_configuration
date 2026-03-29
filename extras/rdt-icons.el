(use-package rdt-icons
  :ensure nil
  :no-require t
  :config
  (use-package all-the-icons
    :ensure t
    :defer t)
  (use-package all-the-icons-dired
    :ensure t
    :defer t
    :hook
    (dired-mode-hook . all-the-icons-dired-mode)))

(provide 'rdt-icons)
