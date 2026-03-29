(use-package rdt-persistent-scratch
  :ensure nil
  :no-require t
  :config
  (use-package persistent-scratch
    :ensure t
    :init
    (persistent-scratch-setup-default)
    (persistent-scratch-autosave-mode 1)))

(provide 'rdt-persistent-scratch)
