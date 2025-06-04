;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;; (package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;; (package! another-package
;;   :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;; (package! this-package
;;   :recipe (:host github :repo "username/repo"
;;            :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;; (package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;; (package! builtin-package :recipe (:nonrecursive t))
;; (package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;; (package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;; (package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;; (unpin! pinned-package)
;; ...or multiple packages
;; (unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;; (unpin! t)

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

(package! emacs-elisp-autofmt :pin "30c9895f9cb64ac83a53b9f3e78a27f5abca322a")
