;; 環境を日本語、UTF-8にする
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

; 半角英字設定
(set-face-attribute 'default nil :family "Consolas" :height 100)
; 全角かな設定
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (font-spec :family "IPAゴシック" :size 14))
; 半角ｶﾅ設定
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  (font-spec :family "ＭＳ ゴシック" :size 14))

;; バックアップファイルを作成させない
(setq make-backup-files nil)

;; 終了時にオートセーブファイルを削除する
(setq delete-auto-save-files t)

;; タブにスペースを使用する
(setq-default tab-width 4 indent-tabs-mode nil)

;; メニューバーを消す
(menu-bar-mode -1)

;; ツールバーを非表示
(tool-bar-mode -1)

;; 行数を表示する
(global-linum-mode t)

;; C-kで行全体を削除する
(setq kill-whole-line t)

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
(eval-after-load 'paredit
   #'(define-key paredit-mode-map (kbd "C-j") nil))

(el-get-bundle aggressive-indent)
(add-hook 'emacs-lisp-mode-hook 'aggressive-indent-mode)
(add-hook 'lisp-interaction-mode-hook 'aggressive-indent-mode)
(add-hook 'clojure-mode-hook 'aggressive-indent-mode)
(add-hook 'clojurescript-mode-hook 'aggressive-indent-mode)