
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/use-package/")
(require 'column-marker)
(require 'fill-column-indicator)
(setq-default auto-fill-function 'do-auto-fill)
(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(add-hook 'after-change-major-mode-hook 'fci-mode)
(add-hook 'prog-mode-hook (lambda () (interactive) (column-marker-1 80)))

(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

(setq column-number-mode t)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (dumb-jump go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; this does not seem to install packages automatically so we use use-package
;; (package-install-selected-packages)
(require 'use-package)
(use-package dumb-jump      :ensure t)
(use-package go-mode        :ensure t)

(dumb-jump-mode)
;; because of iterm
;; https://github.com/jacktasia/dumb-jump/issues/84
(global-set-key (kbd "C-c g") 'dumb-jump-go)
(global-set-key (kbd "C-c p") 'dumb-jump-back)
(global-set-key (kbd "C-c q") 'dumb-jump-quick-look)

(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'before-save-hook #'gofmt-before-save)
