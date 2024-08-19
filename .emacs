(setq comint-prompt-read-only t)
(setq make-backup-files nil)
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

(set-face-attribute 'default nil :height 115)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode 0)

(add-to-list 'load-path "~/evil")
(setq evil-want-C-u-scroll t)
(setq evil-insert-state-cursor t)
(require 'evil)
(evil-mode 1)

(require 'cc-mode)
(require 'ido)
(ido-mode t)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

; Colors
(add-to-list 'default-frame-alist '(font . "Liberation Mono-11.5"))
(set-face-attribute 'default t :font "Liberation Mono-11.5")
(set-face-attribute 'font-lock-builtin-face nil :foreground "white")
(set-face-attribute 'font-lock-comment-face nil :foreground "white")
(set-face-attribute 'font-lock-constant-face nil :foreground "white")
(set-face-attribute 'font-lock-doc-face nil :foreground "black")
(set-face-attribute 'font-lock-function-name-face nil :foreground "white")
(set-face-attribute 'font-lock-keyword-face nil :foreground "white")
(set-face-attribute 'font-lock-string-face nil :foreground "white")
(set-face-attribute 'font-lock-type-face nil :foreground "white")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "white")

(set-foreground-color "white")
(set-background-color "#161616")
(set-cursor-color "white")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-buffer-choice "~/"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minibuffer-prompt ((t (:foreground "white")))))
