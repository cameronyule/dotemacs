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

;;
;;; Google Calendar integration via org-gcal

(setq org-gcal-auth-source-secrets-dir        (expand-file-name "org-gcal/" doom-cache-dir)
      org-gcal-client-secret-file             (expand-file-name "oauth-client-secret.gpg" org-gcal-auth-source-secrets-dir)
      org-gcal-client-secret-file-exists      (file-exists-p org-gcal-client-secret-file)
      org-gcal-oauth-access-token-file        (expand-file-name "oauth-access-tokens.plist" org-gcal-auth-source-secrets-dir)
      org-gcal-oauth-access-token-file-exists (file-exists-p org-gcal-oauth-access-token-file))

(unless org-gcal-client-secret-file-exists
  (warn "org-gcal-client-secret-file not found at %s." org-gcal-client-secret-file))
(unless org-gcal-oauth-access-token-file-exists
  (warn "org-gcal-oauth-access-token-file not found at %s." org-gcal-oauth-access-token-file))

(use-package! org-gcal
  :if org-gcal-client-secret-file-exists
  :init
  (setq org-gcal-client-id "PREVENT_WARNING"
        org-gcal-client-secret "PREVENT_WARNING")
  :config
  (require 'auth-source)

  (setq org-gcal-fetch-file-alist
    `(("cameron@cameronyule.com" . ,(expand-file-name "areas/calendar.org" org-directory))
      ("c_8b079369b185ed644058563f8afa7f9dceaba0f3e4b3cf6a75dda7fe6ae0500e@group.calendar.google.com". ,(expand-file-name "areas/family.org" org-directory))))

  (add-to-list 'auth-sources org-gcal-client-secret-file t)
  (setq org-gcal-client-id "844867342453-6dh4t1hs8i3pqv1t1n1r4pjfjk96rv30.apps.googleusercontent.com")
  (setq org-gcal-client-secret (auth-source-pick-first-password :host "org-gcal-secret" :user "client"))
  (org-gcal-reload-client-id-secret))

(use-package! oauth2-auto
  :if org-gcal-oauth-access-token-file-exists
  :config
  (require 'plstore)
  (pushnew! plstore-encrypt-to "37D49EF99EA1E3B1")
  (setq oauth2-auto-plstore org-gcal-oauth-access-token-file))

 (after! epa
    (setq epg-pinentry-mode 'ask))


;; Allow Alt-3 to enter # on UK keyboards.
;; https://stackoverflow.com/a/4786456
(global-set-key
  (kbd "M-3")
  (lambda ()
    (interactive)
    (insert "#")))

(use-package! typst-ts-mode :mode "\\.typ\\'")
