(use-package rdt-chat
  :ensure nil
  :no-require t
  :config
  ;; to be able to access encripted channels install:
  ;; https://github.com/matrix-org/pantalaimon/tree/master
  (use-package ement
    :ensure t)




  ;; (use-package ement
;;   :quelpa (ement :fetcher github :repo "alphapapa/ement.el"
;;                  ;; :branch
;;                  ;; "fix/157"
;;                  ;; "wip/247-rendering-many-membership-events"
;;                  ;; "wip/user-avatars"
;;                  )
;;   :custom
;;   ;; (ement-auto-view-rooms '(("@alphapapa:matrix.org"
;;   ;;                           "#ement.el:matrix.org" "#org-mode:matrix.org"
;;   ;;                           "#emacs:matrix.org"
;;   ;;                           "#systemcrafters-general:matrix.org")))
;;   (ement-room-prism 'both)
;;   (ement-room-send-message-filter #'ement-room-send-org-filter)
;;   (ement-room-list-default-keys
;;    '(((membership :status 'invite))
;;      ((membership :status 'leave))
;;      (favourite)
;;      (buffer)
;;      (unread)
;;      (low-priority space)
;;      ((and :name "Spaced"
;;            :keys ((not space-p)
;;                   (not people)
;;                   space))
;;       freshness space)
;;      ((and :name "Spaces"
;;            :keys (space-p))
;;       space)
;;      ((and :name "Unspaced"
;;            :keys ((not space)
;;                   (not people)))
;;       freshness)
;;      (people freshness space)))
;;   :config
;;   (add-hook 'ement-after-initial-sync-hook
;;             (defun ap/ement-open-burly-bookmark (session)
;;               "Open Burly bookmark for Ement session."
;;               (bookmark-maybe-load-default-file)
;;               (pcase (ement-user-id (ement-session-user session))
;;                 ("@alphapapa:matrix.org" (bookmark-jump "Burly: @alphapapa:matrix.org (Ement)"))))))
