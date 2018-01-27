(add-to-list 'load-path (locate-user-emacs-file "el-get"))

;; el-getだけは手動でインストールする
;; git clone https://github.com/dimitri/el-get.git
(require 'el-get)
(setq el-get-dir (locate-user-emacs-file "~/.emacs.d/el-get-packages"))

;; カーソル履歴の保持
(el-get-bundle emacsmirror/point-undo)
(define-key global-map [f7] 'point-undo)
(define-key global-map [S-f7] 'point-redo)

;; undo/redo
(el-get-bundle undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;; 補完
(el-get-bundle company)
(global-company-mode)
(setq company-section-wrap-around t)

;; 文法チェック
(el-get-bundle flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; grep(Windows用）
(el-get-bundle xahlee/xah-find)

;; Clojure用
(el-get-bundle clojure-mode)

;; かっこの設定
(el-get-bundle paredit)
(show-paren-mode 1)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'clojurescript-mode-hook 'enable-paredit-mode)
(eval-after-load 'paredit
   #'(define-key paredit-mode-map (kbd "C-j") nil))

;; 自動インデント
(el-get-bundle aggressive-indent)
(add-hook 'emacs-lisp-mode-hook 'aggressive-indent-mode)
(add-hook 'lisp-interaction-mode-hook 'aggressive-indent-mode)
(add-hook 'clojure-mode-hook 'aggressive-indent-mode)
(add-hook 'clojurescript-mode-hook 'aggressive-indent-mode)