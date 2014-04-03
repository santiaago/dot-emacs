;;Add package archive links
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; auto complete
(add-to-list 'load-path "~/.emacs.d")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;;load theme automatically on Emacs startup:
;; (load-theme 'noctilux t) cool dark
;; (load-theme 'solarized-dark t)
;; (load-theme 'zenburn t)
;; (load-theme 'purple-haze t)
(load-theme 'subatomic t)

;; dart mode
;;(require 'dart-mode)

;; go mode
(require 'go-mode-load)

(require 'go-autocomplete)
(require 'auto-complete-config)

;;size of screen
(if (window-system)
  (set-frame-height (selected-frame) 60))
(if (window-system)
(set-frame-width (selected-frame) 124))

;;Enable ido-mode Interactively Do Things
(require 'ido)
(ido-mode t)

;;comment region
(global-set-key [?\C-x?\C-\;] 'comment-or-uncomment-region)

;;color your shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; no tool bar
(tool-bar-mode 0)
;; match parentesis
(show-paren-mode t)

;; show those lines #s
(global-linum-mode t)

;; google c style
(add-hook 'c-mode-common-hook 'google-set-c-style)

;; alt to cmd on mac keyboard
 (setq mac-option-modifier nil
        mac-command-modifier 'meta
        x-select-enable-clipboard t)

;; set javascript indent to 2
(setq js-indent-level 2)

;; wrap region
(wrap-region-mode t)
