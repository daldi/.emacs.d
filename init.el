;; daldi's emacs
;; inspiration from www.EngimaCurry.com
;;

;; All my emacs libraries will be under ~/.emacs.d
(add-to-list 'load-path "~/.emacs.d")
;; Add all top-level subdirectories of .emacs.d to the load path
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

;; See column numbers
(setq column-number-mode t)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; mouse stuff

;; Pbcopy, stdin->osx clipboard buffer tool
(require 'pbcopy)
(turn-on-pbcopy)

;; Ethan Whitespace - OCD whitespace module
;; https://github.com/glasserc/ethan-wspace
(require 'ethan-wspace)
(global-ethan-wspace-mode 1)

;; flymake-python-pyflakes
;; adding flake8/pep8/pythonlint support to emacs
(require 'flymake-easy)
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "flake8")
(setq flymake-python-pyflakes-extra-arguments '("--max-line-length=100"))
