;;Add package archive links
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; auto complete
(add-to-list 'load-path "~/.emacs.d")    ; This may not be appeared if you have already added.
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;;load theme automatically on Emacs startup:

(load-theme 'solarized-dark t)
;;(load-theme 'zenburn t)

;; dart mode
(require 'dart-mode)

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

;;enable jedi autocompletion in python
;;(add-hook 'python-mode-hook 'auto-complete-mode)
;;(add-hook 'python-mode-hook 'jedi:ac-setup)

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)


;;(setq-default py-indent-offset 4)
;;(put 'upcase-region 'disabled nil)
;; alt to cmd on mac keyboard
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)



