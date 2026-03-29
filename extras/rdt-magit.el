(use-package rdt-magit
  :ensure nil
  :no-require t
  :config
  (use-package magit
    :ensure t
    :custom
    (git-commit-major-mode #'text-mode)
    (magit-diff-refine-hunk t)
    (magit-diff-fontify-hunk t)
    (magit-diff-refine-ignore-whitespace t)
    (magit-format-file-function #'magit-format-file-all-the-icons)))

(provide 'rdt-magit)
