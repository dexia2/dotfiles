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

;; 行数を表示する
(global-linum-mode t)

;; カーソル行をハイライトする
(global-hl-line-mode t)

;; タブにスペースを使用
(setq-default tab-width 4 indent-tabs-mode nil)

;; ClipBoard連携
(setq save-interprogram-paste-before-kill t)

;; C-kで行全体を削除する
(setq kill-whole-line t)

;; カーソル位置から行頭まで削除する
(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))
;; C-S-kに設定
(global-set-key (kbd "C-S-k") 'backward-kill-line)

;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)

;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)