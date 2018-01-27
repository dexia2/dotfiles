;; パスの設定
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; el-getの設定
(load (concat user-emacs-directory "init-el-get.el"))

;; テーマ設定
(load-theme 'deeper-blue)

;; メニューバーを消す
(menu-bar-mode -1)

;; ツールバーを非表示
(tool-bar-mode -1)

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

;; 環境を日本語、UTF-8に
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; バックアップファイルを作成しない
(setq make-backup-files nil)

;; 終了時にオートセーブファイルを削除
(setq delete-auto-save-files t)

;; 行番号・列番号を表示する
(global-linum-mode t)
(column-number-mode t)

;; カーソル行をハイライトする
(global-hl-line-mode t)

;; タブにスペースを使用
(setq-default tab-width 4 indent-tabs-mode nil)

;; ClipBoard連携
(setq save-interprogram-paste-before-kill t)

;; C-kで行全体を削除する
(setq kill-whole-line t)

;; 行末の空白を表示
(setq-default show-trailing-whitespace nil)
(defun turn-on-show-trailing-whitespace  () (interactive) (setq show-trailing-whitespace t))
(defun turn-off-show-trailing-whitespace () (interactive) (setq show-trailing-whitespace nil))
(defun toggle-show-trailing-whitespace () (interactive) (callf null show-trailing-whitespace))
(add-hook 'prog-mode-hook 'turn-on-show-trailing-whitespace)
(add-hook 'org-mode-hook 'turn-on-show-trailing-whitespace)

;; カーソル位置から行頭まで削除する
(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))
;; C-S-kに設定
(global-set-key (kbd "C-S-k") 'backward-kill-line)

 ;;"yes or no"を"y or n"にする
(fset 'yes-or-no-p 'y-or-n-p)

;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)

;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)

;; slimeは手動でインストールする
;; git clone https://github.com/slime/slime.git

;; Roswellで入れたClozure CLを使う
(setq inferior-lisp-program "~/.roswell/impls/x86-64/windows/ccl-bin/1.11.5/wx86cl64.exe")

;; slimeの設定
(add-to-list 'load-path (expand-file-name "~/.emacs.d/slime"))
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner)) 
(add-hook 'lisp-mode-hook (lambda ()
       (slime-mode t)
       (show-paren-mode)))