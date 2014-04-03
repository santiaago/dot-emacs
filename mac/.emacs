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
;; (load-theme 'noctilux t) cool dark
;;(load-theme 'solarized-dark t)
;;(load-theme 'zenburn t)
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

;;enable jedi autocompletion in python
;;(add-hook 'python-mode-hook 'auto-complete-mode)
;;(add-hook 'python-mode-hook 'jedi:ac-setup)

;; el-get
;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (let (el-get-master-branch)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp))))
;; (el-get 'sync)

;; google c style
(add-hook 'c-mode-common-hook 'google-set-c-style)

;;(setq-default py-indent-offset 4)
;;(put 'upcase-region 'disabled nil)
;; alt to cmd on mac keyboard

;; (setq mac-right-option-modifier nil)

 (setq mac-option-modifier nil
        mac-command-modifier 'meta
        x-select-enable-clipboard t)

;; color eshell terminal
(add-hook 'eshell-preoutput-filter-functions
           'ansi-color-filter-apply)

;; pomodoro 
(require 'pomodoro) 
(pomodoro-add-to-mode-line)

(set-default-font "Inconsolata 12")

;; set javascript indent to 2
(setq js-indent-level 2)

;; wrap region
(wrap-region-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(browse-url-browser-function (quote browse-url-chromium))
 '(custom-safe-themes (quote ("0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors (quote (("#073642" . 0) ("#546E00" . 20) ("#00736F" . 30) ("#00629D" . 50) ("#7B6000" . 60) ("#8B2C02" . 70) ("#93115C" . 85) ("#073642" . 100))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#dc322f") (40 . "#CF4F1F") (60 . "#C26C0F") (80 . "#b58900") (100 . "#AB8C00") (120 . "#A18F00") (140 . "#989200") (160 . "#8E9500") (180 . "#859900") (200 . "#729A1E") (220 . "#609C3C") (240 . "#4E9D5B") (260 . "#3C9F79") (280 . "#2aa198") (300 . "#299BA6") (320 . "#2896B5") (340 . "#2790C3") (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
