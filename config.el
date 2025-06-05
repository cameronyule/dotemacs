;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

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

(setq display-line-numbers-type t)

(setq org-directory "~/Dropbox/Notes")
(setq org-agenda-files
  (list
    org-directory
    (concat org-directory "/archives")
    (concat org-directory "/areas")
    (concat org-directory "/logs")
    (concat org-directory "/projects")
    (concat org-directory "/references")))

;; Allow Alt-3 to enter # on UK keyboards.
;; https://stackoverflow.com/a/4786456
(global-set-key
  (kbd "M-3")
  (lambda ()
    (interactive)
    (insert "#")))

(use-package! typst-ts-mode :mode "\\.typ\\'")
