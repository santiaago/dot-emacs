;;; Add package archive links
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
			                   ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

;; turn off alarms usex
(setq ring-bell-function 'ignore)

;; auto complete
(add-to-list 'load-path "~/.emacs.d")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; kill other buffers
(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (remove-if-not 'buffer-file-name (buffer-list)))))

;;load theme automatically on Emacs startup:
;; (load-theme 'noctilux t) cool dark
;; (load-theme 'solarized-dark t)
;; (load-theme 'zenburn t)
;; (load-theme 'purple-haze t)

(load-theme 'subatomic t)
(setenv "GOROOT" "/usr/local/go")
(setenv "GOPATH" "/your/go/path/go")

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/go/bin"))
(setq exec-path (append exec-path '("/usr/local/go/bin")))
(setq exec-path (append exec-path '("/your/path/to/go/bin")))

;; git mode
;; (add-to-list 'load-path GIT-MODE-PATH)
(require 'git)
;; (require 'git-blame)
;; go mode

(require 'go-autocomplete)
(require 'auto-complete-config)

(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook '(lambda ()
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-hook 'go-mode-hook '(lambda ()
  (local-set-key (kbd "C-c C-g") 'go-goto-imports)))

(add-hook 'go-mode-hook '(lambda ()
  (local-set-key (kbd "C-c C-f") 'gofmt)))
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook '(lambda ()
  (local-set-key (kbd "C-c C-k") 'godoc)))

; go imports
(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; dart 
(setq exec-path (append exec-path '("/usr/local/dart/dart-sdk/bin")))
(require 'dart-mode)
(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))
(autoload 'dart-mode "dart-mode" "Major mode for editing Dart files" t)

;; reactjs
;;(require 'web-mode)
;;(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(setq web-mode-content-types-alist
  '(("jsx"  . "\\.js[x]?\\'")))

;; Key binding
;; (setq tss-popup-help-key "C-:")
;; (setq tss-jump-to-definition-key "C->")
;; (setq tss-implement-definition-key "C-c i")

;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "tss")

;; Do setting recommemded configuration
(tss-config-default)

;;Enable ido-mode Interactively Do Things
(require 'ido)
(ido-mode t)

;;comment region
(global-set-key [?\C-x?\C-\;] 'comment-or-uncomment-region)

;; no tool bar
(tool-bar-mode 0)

;; match parentesis
(show-paren-mode t)

;; show those lines #s
(global-linum-mode t)

;; google c style
(add-hook 'c-mode-common-hook 'google-set-c-style)

;; set offset to 4 to match xcode c++ style..
(setq-default c-basic-offset 4)

;; flycheck mode
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;;(setq-default py-indent-offset 4)
;;(put 'upcase-region 'disabled nil)
;; alt to cmd on mac keyboard
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)

;; rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;-------------------------------------------------
;; Shift the selected region right if distance is postive, left if
;; negative

;; (defun shift-region (distance)
;;   (let ((mark (mark)))
;;     (save-excursion
;;       (indent-rigidly (region-beginning) (region-end) distance)
;;       (push-mark mark t t)
;;       ;; Tell the command loop not to deactivate the mark
;;       ;; for transient mark mode
;;       (setq deactivate-mark nil))))

;; (defun shift-right ()
;;   (interactive)
;;   (shift-region 1))

;; (defun shift-left ()
;;   (interactive)
;;   (shift-region -1))

;; Bind (shift-right) and (shift-left) function to your favorite keys. I use
;; the following so that Ctrl-Shift-Right Arrow moves selected text one 
;; column to the right, Ctrl-Shift-Left Arrow moves selected text one
;; column to the left:

;; (global-set-key [C-S-right] 'shift-right)
;; (global-set-key [C-S-left] 'shift-left)
;;-------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "light slate blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "royal blue"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "firebrick"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "medium purple"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "OliveDrab2")))))
(put 'narrow-to-region 'disabled nil)

;;; markdown:

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
