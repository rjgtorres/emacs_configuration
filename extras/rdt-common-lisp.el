(use-package rdt-common-lisp
  :ensure nil
  :no-require t
  :config
  (use-package slime
    :ensure t
    :defer t
    :config
    ;; Known Common Lisp implementations.  Use M-- M-x slime to pick one.
    (setq slime-lisp-implementations
          '((ccl ("ccl"))
            (clisp ("clisp" "-q"))
            (cmucl ("cmucl" "-quiet"))
            (sbcl ("sbcl" "--noinform") :coding-system utf-8-unix)))

    (setq slime-default-lisp 'sbcl)

    ;; slime-fancy loads most popular contribs in one go;
    ;; slime-cl-indent provides better CL-aware indentation
    (setq slime-contribs '(slime-fancy slime-cl-indent))

    (setq slime-complete-symbol-function 'slime-flex-completions
          slime-autodoc-use-multiline-p t)

    ;; Uncomment to let the Lisp process evaluate Emacs Lisp.
    ;; Useful for advanced setups but a potential security risk.
    ;; (setq slime-enable-evaluate-in-emacs t)

    ;; rainbow-delimiters messes up colors in slime-repl, so we
    ;; configure the REPL hooks directly instead of using
    ;; prelude-lisp-coding-defaults.
    (add-hook 'slime-repl-mode-hook (lambda ()
                                      (smartparens-strict-mode +1)
                                      (whitespace-mode -1)))

    (define-key slime-mode-map (kbd "C-c C-s") 'slime-selector))

  (defvar *use-slime* t)
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
  ;; more common place is: "/usr/bin/sbcl"
  ;; (setq inferior-lisp-program "/usr/local/bin/sbcl")

  (use-package slime-company
    :ensure t
    :config (setq slime-company-completion 'fuzzy
                  slime-company-after-completion 'slime-company-just-one-space))
  )

(provide 'rdt-common-lisp)
