(use-package rdt-ai
   :ensure nil
   :no-require t
   :config
   ;;; packages I have used, but now have deprecated.
   ;; (use-package copilot
   ;;   :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
   ;;   :ensure t)
   ;; (add-hook 'prog-mode-hook 'copilot-mode)
   ;; (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
   ;; (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

   ;; (use-package copilot-chat
   ;;   :straight (:host github :repo "chep/copilot-chat.el" :files ("*.el"))
   ;;   :after (request org markdown-mode))
   ;; (add-hook 'git-commit-setup-hook 'copilot-chat-insert-commit-message)

   ;; dependencies of agent-shell
   (use-package acp
     :vc (:url "https://github.com/xenodium/acp.el"
               :rev :newest))

   (use-package map
     :ensure t)

   (use-package shell-maker
     :vc (:url "https://github.com/xenodium/shell-maker"
               :rev :newest)
     :after (map))

   ;;; agent-shell
   (use-package agent-shell
     :vc (:url "https://github.com/xenodium/agent-shell"
               :rev :newest)
     :after (shell-maker acp)
     :custom
     (agent-shell-preferred-agent-config (agent-shell-github-make-copilot-config))
     (agent-shell-github-default-model-id "gpt-4.1")
     (agent-shell-github-default-session-mode-id "https://agentclientprotocol.com/protocol/session-modes#plan")
     :bind (:map agent-shell-mode-map
              ("RET" . newline)
              ("M-RET" . shell-maker-submit)))
   )

 (provide 'rdt-ai)
