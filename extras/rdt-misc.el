(use-package rdt-misc
  :ensure nil
  :no-require t
  :config
  (use-package doom-modeline
    :ensure t
    :init (doom-modeline-mode t))
  (use-package rainbow-delimiters
    :ensure t
    :init
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
  (use-package rainbow-mode
    :ensure t
    :defer t)
  (use-package writeroom-mode
    :ensure t
    :defer t
    :init
    (defun my/writeroom_configs ()
        (if writeroom-mode
            (progn
              (text-scale-set 1)
              (display-line-numbers-mode -1))
          (progn
              (text-scale-set 0)
              (display-line-numbers-mode 1))))
    :bind(([f5] . 'writeroom-mode))
    :custom
    (writeroom-width 80)
    (writeroom-restore-window-config t)
    :hook
    (writeroom-mode-hook . my/writeroom_configs))

  (use-package vterm
    :ensure t
    :config
    (defun my/vterm-fast ()
      (interactive)
      (let ((vterm-name "*vterm-fast*"))
        (if (equal (buffer-name) vterm-name)
            (bury-buffer)
          (if (get-buffer vterm-name)
              (switch-to-buffer vterm-name)
            (vterm vterm-name)))))
    :bind (("C-c t" . 'my/vterm-fast)))
  )

(use-package osm
  :ensure t
  :defer
  :bind ("C-c n" . osm-prefix-map) ;; Alternatives: `osm-home' or `osm'
  :init
  (sunrise-sunset)
  :custom
  ;; Take a look at the customization group `osm' for more options.
  (osm-default-server 'default) ;; Configure the tile server
  (osm-default-zoom 15)         ;; Default zoom level
  (osm-copyright nil)             ;; Display the copyright information
  (osm-home (list calendar-latitude calendar-longitude 10))       ;; Home, configure `calendar-latitude/longitude' instead
  ;; (osm-add-server 'cycletravel
  ;;   :name "Cycle.travel"
  ;;   :description "The best cycling planing app"
  ;;   :url
  ;; Add custom servers, see also https://github.com/minad/osm/wiki
  ;; (osm-add-server 'myserver
  ;;   :name "My tile server"
  ;;   :group "Custom"
  ;;   :description "Tiles based on aerial images"
  ;;   :url "https://myserver/tiles/%z/%x/%y.png?apikey=%k"))
(add-hook 'osm-mode-hook (lambda () (visual-line-mode -1)))

(provide 'rdt-misc)
