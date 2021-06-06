;; this file contains search engine defenitions for engine-mode

(defengine amazon
  "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s")

(defengine amauk
  "http://www.amazon.co.uk/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s")

(defengine amade
  "http://www.amazon.de/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s")

(defengine amaes
  "http://www.amazon.es/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s")

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")

(defengine github
  "https://github.com/search?ref=simplesearch&q=%s")

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")

(defengine google-images
  "http://www.google.com/images?hl=en&source=hp&biw=1440&bih=795&gbv=2&aq=f&aqi=&aql=&oq=&q=%s")

(defengine google-maps
  "http://maps.google.com/maps?q=%s"
  :docstring "Mappin' it up.")

;; (defengine project-gutenberg
;;   "http://www.gutenberg.org/ebooks/search/?query=%s")

;; (defengine qwant
;;   "https://www.qwant.com/?q=%s")

;; (defengine rfcs
;;   "http://pretty-rfc.herokuapp.com/search?q=%s")

(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s")

(defengine twitter
  "https://twitter.com/search?q=%s")

(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w"
  :docstring "Searchin' the wikis.")

(defengine wiktionary
  "https://www.wikipedia.org/search-redirect.php?family=wiktionary&language=en&go=Go&search=%s")

(defengine wolfram-alpha
  "http://www.wolframalpha.com/input/?i=%s")

(defengine youtube
  "http://www.youtube.com/results?aq=f&oq=&search_query=%s"
  :keybinding "y")

(defengine hyperspec
  "http://www.lispworks.com/cgi-bin/search.cgi?q=%s&t=-D--HB-"
  :keybinding "l")

(when siscog-p
  (defengine poa
  "https://pms.siscog/main_frame_link.asp?module=defects&category=poa&id=%s&life=0"
  :keybinding "p"))

(defengine scryfall
  "https://scryfall.com/search?q=%s"
  :keybinding "s")
