;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; Tree-sitter based major mode for Typst.
;;
;; Emacs support for tree-sitter is complicated and Doom Emacs currently uses
;; an external elisp package (elisp-tree-sitter)[1] instead of the built-in
;; support that was added in Emacs v29[2]. Once installed, the `typst-ts-mode`
;; package also needs a tree-sitter grammar for Typst, which can be installed
;; via `typst-ts-mc-install-grammar` in Emacs.[3]
;;
;; TODO Revisit this integration once Doom uses the built-in Emacs tree-sitter[2].
;; TODO Consider LSP support for Typst[4].
;;
;; [1] https://github.com/doomemacs/doomemacs/blob/2b1e07dcf0c5ffce89489c960ef59d204fe8ac3e/modules/tools/tree-sitter/packages.el
;; [2] https://github.com/doomemacs/doomemacs/issues/7623
;; [3] https://codeberg.org/meow_king/typst-ts-mode/wiki/Installation.md#requirement
;; [4] https://github.com/Myriad-Dreamin/tinymist?tab=readme-ov-file#installation
;;
(package!
  typst-ts-mode
  :recipe (:host codeberg :repo "meow_king/typst-ts-mode")
  :pin "972dc69d6b8a3f8983f6b8000654f59c8a8d05ba")
