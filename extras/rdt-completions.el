(use-package rdt-completions
  :ensure nil
  :no-require t
  :config
  (use-package company
    ;; :after lsp-mode
    :ensure t
    :init
    (add-hook 'after-init-hook 'global-company-mode)
    :hook (lsp-mode . company-mode)
    ;; :bind (:map lsp-mode-map
    ;;             ("<tab>" . company-indent-or-complete-common))
    :bind (:map company-active-map
                ("<tab>" . company-complete-selection))
    :custom
    (company-show-numbers              t)
    (company-minimum-prefix-length     1)
    (company-idle-delay                0)
    (company-selection-wrap-around     t)
    (company-tooltip-limit            10)
    (company-tooltip-align-annotations t)
    (company-tooltip-flip-when-above   t)
    (company-backends
     '((company-files          ; files & directory
        company-capf           ; what is this?
        company-yasnippet
        company-bbdb
        company-semantic
        company-cmake
        company-clang)
       (company-abbrev
        company-dabbrev)
       (company-dabbrev-code
        company-gtags
        company-etags
        company-keywords)
       company-oddmuse))))

(provide 'rdt-completions)




;; (use-package company-box
;;     :after company
;;   :hook (company-mode . company-box-mode))

;; (use-package slime-company
;; :config
;; (slime-setup '(slime-company)))
