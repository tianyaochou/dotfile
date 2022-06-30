;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Tianyao Chou"
      user-mail-address "hej@tianyao.ch")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "SF Mono" :size 12 :weight 'semi-light))
      ;; doom-unicode-font (font-spec :family "Apple Color Emoji" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-day)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq projectile-project-root "~/Projects")
(setq projectile-enable-caching 'nil)
(setq lsp-enable-semantic-highlighting 't)

;; Coq
(setq coq-smie-user-tokens
      '(("∗" . "*")
        ("-∗" . "->")
        ("∗-∗" . "<->")
        ("==∗" . "->")
        ("⊢" . "->")
        ("⊣⊢" . "<->")
        ("⋅" . "*")
        (":>" . ":=")
        ("by" . "now")
        ("forall" . "now")))

(use-package! unicode-math-input
  :hook
  (coq-mode . (lambda () (set-input-method "unicode-math"))))

(after! company-coq
  (add-to-list 'company-coq-disabled-features 'unicode-math-backend)
  (set-company-backend! 'coq-mode
    'company-coq-master-backend 'company-coq-choices-backend)
  (setq company-coq-live-on-the-edge 'nil))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(after! markdown-mode (markdown-toggle-markup-hiding))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#eaeaea" "#c82829" "#718c00" "#eab700" "#3e999f" "#c9b4cf" "#8abeb7" "#4d4d4c"])
 '(custom-safe-themes
   (quote
    ("99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" default)))
 '(fci-rule-color "#a3a1a1")
 '(jdee-db-active-breakpoint-face-colors (cons "#f2f2f2" "#4271ae"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#f2f2f2" "#718c00"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#f2f2f2" "#a5a4a5"))
 '(objed-cursor-color "#c82829")
 '(pdf-view-midnight-colors (cons "#4d4d4c" "#ffffff"))
 '(rustic-ansi-faces
   ["#ffffff" "#c82829" "#718c00" "#eab700" "#3e999f" "#c9b4cf" "#8abeb7" "#4d4d4c"])
 '(vc-annotate-background "#ffffff")
 '(vc-annotate-color-map
   (list
    (cons 20 "#718c00")
    (cons 40 "#999a00")
    (cons 60 "#c1a800")
    (cons 80 "#eab700")
    (cons 100 "#eda70a")
    (cons 120 "#f19714")
    (cons 140 "#f5871f")
    (cons 160 "#e69659")
    (cons 180 "#d7a594")
    (cons 200 "#c9b4cf")
    (cons 220 "#c88597")
    (cons 240 "#c85660")
    (cons 260 "#c82829")
    (cons 280 "#bf4748")
    (cons 300 "#b66667")
    (cons 320 "#ad8586")
    (cons 340 "#a3a1a1")
    (cons 360 "#a3a1a1")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
