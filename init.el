;; daldi's emacs
;;
;; inspiration from www.EngimaCurry.com
;;

;; Let's make sure to end with a newline
;; this is supersedeed by ethan-wspace
;; (setq require-final-newline t)

;;Library Paths
;; All my emacs libraries will be under ~/.emacs.d/lisp
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))
;; I like to keep third party libraries seperate in ~/.emacs.d/lisp/vendor
;; make sure to load any subdirs under vendor
(let ((default-directory "~/.emacs.d/vendor/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; See column numbers
(setq column-number-mode t)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;;
;;Libraries
;;
;; mouse stuff
(setq select-active-regions nil)
(setq mouse-drag-copy-region t)
(global-set-key [mouse-2] 'mouse-yank-at-click)

;; Pbcopy, stdin->osx clipboard buffer tool
(require 'pbcopy)
(turn-on-pbcopy)

;; Ethan Whitespace - OCD whitespace module
;; https://github.com/glasserc/ethan-wspace
(require 'ethan-wspace)
(global-ethan-wspace-mode 1)

;; flymake-python-pyflakes
;; https://github.com/purcell/flymake-python-pyflakes
;; https://github.com/purcell/flymake-easy
;; adding flake8/pep8/pythonlint support to emacs
(require 'flymake-easy)
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "flake8")
(setq flymake-python-pyflakes-extra-arguments '("--max-line-length=100"))

;; flymake upgrade
;; https://github.com/illusori/emacs-flymake
;; Let's run 16 checks at once instead.
(setq flymake-max-parallel-syntax-checks 16)

;;
;; daldi's libraries
;;
;; Better backup files
(load-library "daldi-backups")
