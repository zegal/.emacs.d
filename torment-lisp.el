(require 'paredit)
(require 'elisp-slime-nav)

(setq slime-net-coding-system 'utf-8-unix)
(setq slime-protocol-version 'ignore)
(setq slime-complete-symbol*-fancy t)
(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

(if (equal system-type 'windows-nt)
	(progn
	  (setq inferior-lisp-program "c:/sbcl/sbcl.exe")))

(if (equal system-type 'darwin)
	(progn
	  (setq inferior-lisp-program "/usr/local/bin/ccl -K utf-8")))

;;(load (expand-file-name "~/quicklisp/slime-helper.el"))

(add-to-list 'auto-mode-alist '("\\.gnus$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.emacs$" . emacs-lisp-mode))

(global-set-key (kbd "C-c s") 'slime-selector)

(put 'paredit-forward-delete 'delete-selection 'supersede)
(put 'paredit-backward-delete 'delete-selection 'supersede)
(put 'paredit-newline 'delete-selection t)

(eval-after-load 'paredit
  '(progn
	 (define-key paredit-mode-map (kbd "C-j") 'paredit-join-sexps)
	 (define-key paredit-mode-map (kbd "C-s") 'paredit-split-sexp)
	 (define-key paredit-mode-map (kbd "C-l") 'paredit-splice-sexp)
     (define-key paredit-mode-map (kbd "M-s") 'swiper)
     (define-key paredit-mode-map (kbd "M-r") 'swiper)))


(add-hook 'lisp-mode-hook
		  (lambda ()
			(enable-paredit-mode)
			(autopair-mode -1)))

(add-hook 'emacs-lisp-mode-hook
		  (lambda ()
			(enable-paredit-mode)
			(autopair-mode -1)))


(add-hook 'slime-mode-hook 'set-up-slime-ac)

(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

(add-hook 'emacs-lisp-mode-hook
		  (lambda ()
			(rainbow-mode)
			(elisp-slime-nav-mode t)
			(add-to-list 'ac-sources 'ac-source-emacs-lisp-features)
			(local-set-key [return] 'newline-and-indent)))
