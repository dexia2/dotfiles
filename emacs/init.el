(when load-file-name
    (setq user-emacs-directory (file-name-directory load-file-name)))

;; el-get
(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(require 'el-get)
;; el-getでダウンロードしたパッケージは ~/.emacs.d/ に入るようにする
(setq el-get-dir (locate-user-emacs-file ""))

;SBCLをデフォルトのCommon Lisp処理系に設定
(setq inferior-lisp-program "sbcl")
;; ~/.emacs.d/slimeをload-pathに追加
(add-to-list 'load-path (expand-file-name "~/.emacs.d/slime"))
;; SLIMEのロード
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner)) 

(setq slime-lisp-implementations
      `((ros ("ros" "run"))
	(sbcl ("/opt/local/bin/sbcl"))
	(abcl ("/opt/local/bin/abcl"))
	(clisp ("/opt/local/bin/clisp"))))

(load-theme 'misterioso)

(el-get-bundle clojure-mode)

(el-get-bundle company)
(global-company-mode)
(setq company-section-wrap-around t)

(el-get-bundle paredit)
(show-paren-mode 1)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'clojurescript-mode-hook 'enable-paredit-mode)

(el-get-bundle aggressive-indent)
(add-hook 'emacs-lisp-mode-hook 'aggressive-indent-mode)
(add-hook 'lisp-interaction-mode-hook 'aggressive-indent-mode)
(add-hook 'clojure-mode-hook 'aggressive-indent-mode)
(add-hook 'clojurescript-mode-hook 'aggressive-indent-mode)