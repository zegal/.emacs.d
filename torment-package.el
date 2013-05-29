(require 'package)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))        


(package-initialize)

(require-package 'ac-slime)
(require-package 'ace-jump-mode)
(require-package 'auto-indent-mode)
(require-package 'auto-complete)
(require-package 'auto-complete-clang)
(require-package 'autopair)
(require-package 'bm)
(require-package 'color-theme-sanityinc-tomorrow)
(require-package 'cycbuf)
(require-package 'deft)
(require-package 'dictionary)
(require-package 'elisp-slime-nav)
(require-package 'escreen)
(require-package 'etags-table)
(require-package 'expand-region)
(require-package 'graphviz-dot-mode)
(require-package 'helm)
(require-package 'helm-git)
(require-package 'helm-gtags)
(require-package 'highlight-parentheses)
(require-package 'highlight-symbol)
(require-package 'hungry-delete)
(require-package 'idle-highlight-mode)
(require-package 'iedit)
(require-package 'js2-mode)
(require-package 'lusty-explorer)
(require-package 'magit)
(require-package 'multiple-cursors)
(require-package 'maxframe)
(require-package 'mic-paren)
(require-package 'mo-git-blame)
(require-package 'paredit)
(require-package 'rainbow-delimiters)
(require-package 'rainbow-mode)
(require-package 'rinari)
(require-package 'restclient)
(require-package 'rsense)
(require-package 'ruby-electric)
(require-package 'ruby-tools)
(require-package 'session)
(require-package 'slim-mode)
(require-package 'smex)
(require-package 'skewer-mode)
(require-package 'slime)
(require-package 'sml-modeline)
(require-package 'sunrise-commander)
(require-package 'textile-mode)
(require-package 'undo-tree)
(require-package 'web-mode)
(require-package 'wrap-region)
(require-package 'window-number)
(require-package 'yaml-mode)
(require-package 'yasnippet)
