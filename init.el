;;; init.el -*- lexical-binding: t; -*-

;; NOTE 'SPC h d h' to access Doom's documentation.
;; NOTE 'K' on a module's name (or its flags) to view its documentation.
;; NOTE 'gd' on a module's name to browse its source code.

(doom!
  :app
  calendar

  :completion
  (corfu +orderless)
  vertico

  :ui
  doom
  doom-dashboard
  hl-todo
  indent-guides
  modeline
  ophints
  (popup +defaults)
  tabs
  treemacs
  (vc-gutter +pretty)
  vi-tilde-fringe
  workspaces
  zen

  :editor
  (evil +everywhere)
  fold

  :emacs
  dired
  electric
  undo
  vc

  :term
  vterm

  :checkers
  syntax
  (spell +flyspell +everywhere)

  :tools
  debugger
  direnv
  editorconfig
  (eval +overlay)
  lookup
  (lsp +peek)
  (magit +forge)
  tree-sitter

  :os
  (:if (featurep :system 'macos) macos)
  tty

  :lang
  emacs-lisp
  markdown
  (nix +tree-sitter +lsp)
  (org +pandoc +roam2)
  (python +lsp +pyright)
  (rust +tree-sitter +lsp)
  (sh +tree-sitter +lsp)
  (yaml +tree-sitter)

  :config
  ;;literate
  (default +bindings +smartparens +gnupg))
