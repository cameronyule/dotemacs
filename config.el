;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(setq doom-theme 'doom-solarized-light)

;; Using fixed (monospace) and variable (proportional) fonts dependent on context.
;;
;; See:
;;
;; https://github.com/doomemacs/doomemacs/tree/master/modules/ui/doom#changing-fonts
;; https://github.com/doomemacs/doomemacs/tree/master/modules/ui/zen
;; https://discourse.doomemacs.org/t/cant-size-doom-variable-pitch-font/4572/3
;;
;; http://yummymelon.com/devnull/tuning-emacs-to-write-prose-in-org-and-markdown.html
;; https://sophiebos.io/posts/beautifying-emacs-org-mode/#fonts
;; https://hieuphay.com/doom-emacs-config/#font-configs
;; https://zzamboni.org/post/beautifying-org-mode-in-emacs/#step-2-setting-up-variable-pitch-and-fixed-pitch-faces

(setq doom-font
  (font-spec :family "FiraCode Nerd Font" :weight 'medium :size 12))
(setq doom-variable-pitch-font (font-spec :family "ETBembo" :size 16))

(use-package!
  mixed-pitch
  :hook ((org-mode . mixed-pitch-mode) (markdown-mode . mixed-pitch-mode))
  :config (setq mixed-pitch-set-height t))

;; https://hieuphay.com/doom-emacs-config/#turn-off-highlighting-current-line
(add-hook 'text-mode-hook (lambda () (hl-line-mode -1)))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/Notes")
(setq org-agenda-files
  (list
    org-directory
    (concat org-directory "/archives")
    (concat org-directory "/areas")
    (concat org-directory "/logs")
    (concat org-directory "/projects")
    (concat org-directory "/references")))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; As we install libvterm via Nix, we need to let emacs-libvterm know the Nix store path.
;; https://github.com/akermu/emacs-libvterm/blob/056ad74653704bc353d8ec8ab52ac75267b7d373/vterm.el#L69
(setq
  vterm-module-cmake-args
  "-DLIBVTERM_INCLUDE_DIR=@libvterm@/include -DLIBVTERM_LIBRARY=@libvterm@/lib/libvterm.dylib")

;; Allow Alt-3 to enter # on UK keyboards.
;; https://stackoverflow.com/a/4786456
(global-set-key
  (kbd "M-3")
  (lambda ()
    (interactive)
    (insert "#")))

(use-package! typst-ts-mode :mode "\\.typ\\'")

(use-package!
  elisp-autofmt
  :hook (emacs-lisp-mode . elisp-autofmt-mode)
  :config (setq elisp-autofmt-python-bin "python3"))
