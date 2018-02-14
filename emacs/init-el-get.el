(add-to-list 'load-path (locate-user-emacs-file "el-get"))

;; el-getだけは手動でインストールする
;; git clone https://github.com/dimitri/el-get.git
(require 'el-get)
(setq el-get-dir (locate-user-emacs-file "~/.emacs.d/el-get-packages"))

;; カーソル履歴の保持
(el-get-bundle emacsmirror/point-undo)
(require 'point-undo)
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
(setq company-dabbrev-downcase nil)

;; 文法チェック
(el-get-bundle flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; grep(Windows用）
(el-get-bundle xahlee/xah-find)

;; キーバインド確認
(el-get-bundle which-key)
(which-key-mode t)
(which-key-setup-side-window-bottom)

;; Lispの設定
(defvar lisp-hooks
  '(emacs-lisp-mode-hook
    lisp-interaction-mode-hook
    clojure-mode-hook
    clojurescript-mode-hook))

;; Clojure用
(el-get-bundle clojure-mode)

;; かっこの設定
(el-get-bundle paredit)
(eval-after-load 'paredit
   #'(define-key paredit-mode-map (kbd "C-j") nil))
(dolist (hook lisp-hooks nil)
  (add-hook hook 'enable-paredit-mode))

;; 自動インデント
(el-get-bundle aggressive-indent)
(dolist (hook lisp-hooks nil)
  (add-hook hook  'aggressive-indent-mode))

;; Git管理
(el-get-bundle magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; 範囲選択
(el-get-bundle expand-region)
(global-set-key (kbd "C-]") 'er/expand-region)
(global-set-key (kbd "C-M-]") 'er/contract-region)
(transient-mark-mode t)

;; プロジェクト管理
(el-get-bundle projectile)
(projectile-global-mode)

;; 文字のカーソル移動
(el-get-bundle ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; コピペ時のカラー
(el-get-bundle volatile-highlights)
(volatile-highlights-mode t)

;; モードラインの編集
(el-get-bundle powerline)
(powerline-default-theme)