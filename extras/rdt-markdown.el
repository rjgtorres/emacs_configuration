(use-package rdt-markdown
  :ensure nil
  :no-require t
  :config
  (use-package markdown-mode
    :ensure t
    :defer t))

(provide 'rdt-markdown)
