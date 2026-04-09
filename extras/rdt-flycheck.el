(use-package rdt-flycheck
  :ensure nil
  :no-require t
  :config
  (use-package flycheck
    :ensure t
    :custom
    ;; bazel-buildifier in flycheck no longer working. Disable.
    (flycheck-disabled-checkers '(bazel-buildifier))
    ;; Override default flycheck triggers
    (flycheck-check-syntax-automatically '(save idle-change mode-enabled))
    (flycheck-idle-change-delay 0.8)
    :config
    (use-package flycheck-status-emoji
      :ensure t
      :custom
      (flycheck-status-emoji-indicator-finished-error ?💀)
      (flycheck-status-emoji-indicator-finished-ok ?👍)
      (flycheck-status-emoji-indicator-finished-warning ?👎)
      :config
      (flycheck-status-emoji-mode +1))

    (use-package flycheck-inline
      :ensure t
      :hook (flycheck-mode . turn-on-flycheck-inline)))
  (use-package flycheck-eglot
    :ensure t
    :after (flycheck eglot)
    :config
    (global-flycheck-eglot-mode 1)))

(provide 'rdt-flycheck)
