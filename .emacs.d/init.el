;; Disable annoying things
(menu-bar-mode -1)
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))
(setq inhibit-startup-screen t)        ; Disable startup screen with graphics
(setq visible-bell nil)                ; Disable annoying visual bell graphic
(setq ring-bell-function 'ignore)      ; Disable super annoying audio bell

;; native line numbers
(global-display-line-numbers-mode)
(setq-default display-line-numbers 'visual
              display-line-numbers-current-absolute t
              display-line-numbers-width 3 
              display-line-numbers-widen t)
(set-face-attribute 'line-number nil)
(set-face-attribute 'line-number-current-line nil
                    :background "black" :foreground "red")

;; Toggle line wrapping to Ctrl+c > l
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)

;; Change tabs to 2 widths, and then change tabs to a series of spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; Scroll down one line at a time instead of a half page
(setq scroll-step            1
      scroll-conservatively  10000)


;; Our emacs repos
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Load a nice color theme
;; cd; ~/.emacs.d; wget https://raw.githubusercontent.com/emacs-jp/replace-colorthemes/master/tty-dark-theme.el 
(load-theme 'tty-dark t t)
(enable-theme 'tty-dark)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7de92d9e450585f9f435f2d9b265f34218cb235541c3d0d42c154bbbfe44d4dd" default))
 '(package-selected-packages
   '(sculpture-themes flymake-go go-autocomplete auto-complete exec-path-from-shell go-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Enable autocomplete, and autocomplete for go
(ac-config-default)
(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

