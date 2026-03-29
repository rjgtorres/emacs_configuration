(use-package rdt-lsp
  :ensure nil
  :no-require t
  :config
  (use-package eglot
    :ensure nil
    :custom
    (eglot-autoshutdown t)
    (eglot-events-buffer-size 0) ;; EMACS-31 -- do we still need it?
    (eglot-events-buffer-config '(:size 0 :format full))
    (eglot-prefer-plaintext nil)
    (jsonrpc-event-hook nil)
    (eglot-code-action-indications nil) ;; EMACS-31 -- annoying as hell
    :init
    (fset #'jsonrpc--log-event #'ignore)

    (setq-default eglot-workspace-configuration (quote
                                                 (:gopls (:hints (:parameterNames t)))))

    (defun emacs-solo/eglot-setup ()
      "Setup eglot mode with specific exclusions."
      (unless (memq major-mode '(emacs-lisp-mode lisp-mode))
        (eglot-ensure)))

    (add-hook 'prog-mode-hook #'emacs-solo/eglot-setup)

    (with-eval-after-load 'eglot
      (add-to-list
       'eglot-server-programs
       '((ruby-mode ruby-ts-mode) "ruby-lsp")))

    (with-eval-after-load 'eglot
      (add-to-list
       'eglot-server-programs
       '((tsx-ts-mode typescript-ts-mode js-mode js-jsx-mode js-ts-mode)
         . ("rass"
            "--"
            "typescript-language-server" "--stdio"
            "--"
            "eslint-lsp" "--stdio"
            "--"
            "tailwindcss-language-server" "--stdio"))))

    (with-eval-after-load 'eglot
      (add-to-list
       'eglot-server-programs
       '((c++-ts-mode c-ts-mode c++-mode c-mode) . ("clangd" "-j=8" "--log=error" "--header-insertion=never"))))


    (with-eval-after-load 'eglot
      ;; install pip install fortran-language-server
      (add-to-list
       'eglot-server-programs
       '((f90-ts-mode f90-mode Fortran-mode) . ("fortls" "--nthreads=4"))))
    
    :bind (:map
           eglot-mode-map
           ("C-c l a" . eglot-code-actions)
           ("C-c l o" . eglot-code-action-organize-imports)
           ("C-c l r" . eglot-rename)
           ("C-c l i" . eglot-inlay-hints-mode)
           ("C-c l f" . eglot-format)))


  ;;; LSP configuration, this works, but I want to try and use the included package
  ;; (use-package lsp-mode
  ;;   :straight t
  ;;   :commands (lsp lsp-deferred)
  ;;   :init
  ;;   (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  ;;   :hook ((prog-mode . lsp-deferred)
  ;;          (f90-mode . lsp-mode)
  ;;          (python-mode . lsp-mode)
  ;;          (c-mode . lsp)
  ;;          (c++-mode . lsp)
  ;;          (lsp-mode . lsp-enable-which-key-integration))
  ;;   :config
  ;;   (progn
  ;;     (lsp-register-client
  ;;      (make-lsp-client :new-connection (lsp-tramp-connection "clangd")
  ;;                       :major-modes '(c-mode c++-mode)
  ;;                       :remote? t
  ;;                       :server-id 'clangd-remote))))
  ;; (setq gc-cons-threshold 100000000) ;; necessary due to communication
  ;; (use-package helm-lsp
  ;;   :straight t
  ;;   :config
  ;;   (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol))
  ;; (use-package lsp-ui
  ;;   :straight t
  ;;   :hook (lsp-mode . lsp-ui-mode)
  ;;   :custom
  ;;   (lsp-ui-doc-position 'bottom))
  ;; (use-package lsp-treemacs
  ;;   ;; project wide overview
  ;;   :commands lsp-treemacs-errors-list)
  ;; (use-package lsp-sonarlint
  ;;   :custom
  ;;   ;; Allow sonarlint to download and unzip the official VSCode extension
  ;;   ;; If nil, you'll have to do that yourself. See also `lsp-sonarlint-download'
  ;;   ;; `lsp-sonarlint-download-url' and `lsp-sonarlint-download-dir'
  ;;   (lsp-sonarlint-auto-download t)

  ;;   ;; Choose which analyzers you want enabled. By default all are enabled
  ;;   ;; See command `lsp-sonarlint-available-analyzers' for the full list.
  ;;   (lsp-sonarlint-enabled-analyzers '("cfamily"))
  ;;   (lsp-sonarlint-cfamily-compilation-commands-path "./build/"))
  )

(provide 'rdt-lsp)
