(use-package rdt-media
  :ensure nil
  :no-require t
  :config
  ;; ############################# reading #############################
  (use-package reddigg
    :ensure t
    :config
    (setq org-confirm-elisp-link-function nil
          reddigg-subs '(emacs portugal Common_Lisp Algarve Faro EDH Fantasy lisp mtg magicTCG odivelas sbcl DevinTownsend devpt brompton)))

  (use-package elfeed
     :ensure t
     :bind (("C-c f" . 'elfeed))
     :hook (('elfeed-new-entry-hook . (elfeed-make-tagger :feed-url "youtube\\.com"
                                                         :add '(video youtube)))
            ('elfeed-new-entry-hook . (elfeed-make-tagger before "2 weeks ago"
                                                         :remove 'unread)))
     :custom
     (elfeed-curl-program-name "curl")
     (elfeed-curl-timeout 200)
     (url-queue-timeout 500)
     (elfeed-db-directory (expand-file-name "cache/elfeed" user-emacs-directory))
     (elfeed-feeds
      '("https://world.hey.com/dhh/feed.atom"
        "https://planet.emacslife.com/atom.xml"
        "https://protesilaos.com/master.xml"
        "https://delitodeopiniao.blogs.sapo.pt/data/rss"
        "https://meiadeleite.com/feed/"))
     :config
     (elfeed-update)
     ;; the default filter elfeed uses
     (setq-default elfeed-search-filter "@6-months-ago +unread"))

  ;; (use-package reader
  ;;   ;; ####### Might need the following steps:
  ;;   ;; Installing mupdf and mupdf-devel (rpm-ostree install --apply-live mupdf mupdf-devel)
  ;;   ;; create folder: /usr/local/lib/pkgconfig/
  ;;   ;; Creating the mupdf.pc inside the folder /usr/local/lib/pkgconfig/ with

  ;;   ;; prefix=/usr/local
  ;;   ;; exec_prefix=${prefix}
  ;;   ;; libdir=${exec_prefix}/lib
  ;;   ;; includedir=${prefix}/include

  ;;   ;; Name: mupdf
  ;;   ;; Description: Library for rendering PDF documents
  ;;   ;; Requires.private: freetype2
  ;;   ;; Version: VERSION
  ;;   ;; Libs: -L${libdir} -lmupdf
  ;;   ;; Libs.private: -lmujs -lgumbo -lopenjp2 -ljbig2dec -ljpeg -lz -lm
  ;;   ;; Cflags: -I${includedir}
    
  ;;   ;; Adding /usr/local/lib/pkgconfig to PKG_CONFIG_PATH: export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
  ;;   :vc (:url "https://codeberg.org/MonadicSheep/emacs-reader"))

  (use-package ready-player
    :ensure t
    :defer t
    :config
    (ready-player-mode +1))
  
  (use-package pdf-tools
    :ensure t
    :defer t
    :config (pdf-loader-install)
    :hook (pdf-view-mode . (lambda ()
                             (pdf-tools-enable-minor-modes))))

  ;; epub reader
  (use-package nov
    :ensure t
    :defer t
    :init
    (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))))

(provide 'rdt-media)
