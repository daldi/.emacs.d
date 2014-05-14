;; daldi's emacs
;; inspiration from www.EngimaCurry.com
;;

;; All my emacs libraries will be under ~/.emacs.d
(add-to-list 'load-path "~/.emacs.d")
;Add all top-level subdirectories of .emacs.d to the load path
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Pbcopy, stdin->osx clipboard buffer tool
(require 'pbcopy)
(turn-on-pbcopy)

;; Ethan Whitespace - OCD whitespace module
;; https://github.com/glasserc/ethan-wspace
(require 'ethan-wspace)
(global-ethan-wspace-mode 1)
