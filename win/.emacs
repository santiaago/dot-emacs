;; santiago .emacs windows config
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(load-theme 'zenburn t)

;; set full screen here

;; ido mode
(require 'ido)
(ido-mode t)

;; go mode
(require 'go-mode-load)

;; auto-complete
(add-to-list 'load-path "~/.emacs.d")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
