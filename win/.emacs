;; santiago .emacs windows config
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(load-theme 'solarized-dark t)
;;(load-theme 'zenburn t)

;;comment region
(global-set-key [?\C-x?\C-\;] 'comment-or-uncomment-region)

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

;; no tool bar
(tool-bar-mode 0)
;; match parentesis
(show-paren-mode t)

;;size of screen
(if (window-system)
  (set-frame-height (selected-frame) 60))
(if (window-system)
(set-frame-width (selected-frame) 124))
