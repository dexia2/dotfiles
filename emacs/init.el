;; パスの設定
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; el-getの設定
;; 事前にGithubからel-getをclone
(load (concat user-emacs-directory "init-el-get.el"))

;; テーマ設定
;; (load-theme 'deeper-blue)

;; メニューバーを消す
(menu-bar-mode -1)

;; ツールバーを非表示
(tool-bar-mode -1)

;; ファイルのフルパスを表示
(setq frame-title-format "%f")

;; ビープ音を消す
(setq visible-bell t)
(setq ring-bell-function 'ignore)

; 英字設定
;; (set-face-attribute 'default nil :family "Consolas" :height 100)
; 日本語設定
;; (set-fontset-font (frame-parameter nil 'font)
;;                  'japanese-jisx0208
;;                  (font-spec :family "游ゴシック" :size 14))

;; 環境を日本語、UTF-8に
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; オートセーブOff
(setq auto-save-default nil)

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; 変更ファイルのバックアップ
(setq make-backup-files nil)

;; 変更ファイルの番号つきバックアップ
(setq version-control nil)

;; 編集中ファイルのバックアップ
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)

;; ロックファイルを生成しない
(setq create-lockfiles nil)

;; 行番号・列番号を表示する
(global-linum-mode t)
(column-number-mode t)

;; カーソル行をハイライトする
(global-hl-line-mode t)

;; タブにスペースを使用
(setq-default tab-width 4 indent-tabs-mode nil)

;; かっこの設定
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)

;; mini-bufferでヤンクできるように
(define-key isearch-mode-map "\C-y" 'isearch-yank-kill)

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
  (interactive "p")
  (kill-line 0))
(global-set-key (kbd "C-S-k") 'backward-kill-line)

;;行のコピー
(defun copy-line (arg)
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
(global-set-key "\C-c\C-k" 'copy-line)

;;キルリングに入れない削除
(defun ruthlessly-kill-line ()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line 1)
  (setq kill-ring (cdr kill-ring)))
(global-set-key (kbd "M-k") 'ruthlessly-kill-line)

;; 単語削除
(defun my-kill-thing-at-point (thing)
  (let ((bounds (bounds-of-thing-at-point thing)))
    (if bounds
        (kill-region (car bounds) (cdr bounds))
      (error "No %s at point" thing))))
(defun my-kill-word-at-point ()
  "Kill the word at point."
  (interactive)
  (my-kill-thing-at-point 'word))
(define-key global-map (kbd "C-@") 'my-kill-word-at-point)

;; C-hをbackspaceに
(keyboard-translate ?\C-h ?\C-?)

;; window切り替え
(define-key global-map (kbd "C-t") 'other-window)

;; buffer操作
(define-key global-map (kbd "C-x b") 'list-buffers)
(define-key global-map (kbd "C-o") 'switch-to-buffer)

;; 閉じる
(define-key global-map (kbd "C-x c") 'kill-emacs)

;; ファイルを開く
(define-key global-map (kbd "C-x f") 'find-file)

;;"yes or no"を"y or n"にする
(fset 'yes-or-no-p 'y-or-n-p)

;;; C-x C-fなどをffap関係のコマンドに割り当てる
(ffap-bindings)

;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)

;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)

;;diredで削除したときにゴミ箱へ移動させる
(setq delete-by-moving-to-trash t)

;; slimeは手動でインストールする
;; git clone https://github.com/slime/slime.git

;; Roswellで入れたClozure CLを使う
;; (setq inferior-lisp-program "~/.roswell/impls/x86-64/windows/ccl-bin/1.11.5/wx86cl64.exe")

;; slimeの設定
;; ((add-to-list 'load-path (expand-file-name "~/.emacs.d/slime"))
;; ((require 'slime)
;; ((slime-setup '(slime-repl slime-fancy slime-banner)
;; ((add-hook 'lisp-mode-hook (lambda ()
;; (                            (slime-mode t)
;; (                            (show-paren-mode)))
