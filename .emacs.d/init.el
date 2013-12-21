(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/")
	(expand-file-name "~/.emacs.d/elisp/el-get/el-get/")
	(expand-file-name "~/.emacs.d/elisp/el-get/go-mode/")
	(expand-file-name "~/.emacs.d/el-get/color-theme")
        (expand-file-name "~/.emacs.d/el-get/"))
       load-path))

(define-key global-map [2213] nil)
(define-key global-map [67111077] nil)
(define-key global-map [134219941] nil)
(define-key global-map [201328805] nil)
(define-key function-key-map [2213] [?\\])
(define-key function-key-map [67111077] [?\C-\\])
(define-key function-key-map [134219941] [?\M-\\])
(define-key function-key-map [201328805] [?\C-\M-\\])

(define-key global-map [3420] nil)
(define-key global-map [67112284] nil)
(define-key global-map [134221148] nil)
(define-key global-map [201330012] nil)
(define-key function-key-map [3420] [?\\])
(define-key function-key-map [67112284] [?\C-\\])
(define-key function-key-map [134221148] [?\M-\\])
(define-key function-key-map [201330012] [?\C-\M-\\])


(show-paren-mode)
 
;;display time
(display-time)

;; デフォルトの透明度を設定する (85%)
(add-to-list 'default-frame-alist '(alpha . 85))
;; カレントウィンドウの透明度を変更する (85%)
(set-frame-parameter nil 'alpha 85)

;; メニューバー削除
(tool-bar-mode -1)

;全角スペースに緑の色づけ。全角スペースは罠だよ =(
(defface my-face-b-1 '((t (:background "green"))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
 (font-lock-add-keywords
  major-mode
  '(("　" 0 my-face-b-1 append)
  )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; mac ならcommandキーをメタキーにする
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))

;; for el-get
(require 'el-get)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(el-get 'sync)
;; auto install el-get.el
(defvar my/el-get-packages
  '(
    ;; package list
    session
    helm
    )
  "A list of packages to install from el-get at launch.")
(el-get 'sync my/el-get-packages)


;; for package.el
;; Package Manegement
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;; auto install
(require 'cl)
(defvar installing-package-list
  '(
    ;; package list
    ))
(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))


;; for haskell
(load "~/.emacs.d/haskell-mode/haskell-site-file")

(add-to-list 'load-path "~/.emacs.d/haskell-mode")
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)


(add-to-list 'load-path "~/.emacs.d")
(require 'auto-save-buffers)
(run-with-idle-timer 1 t 'auto-save-buffers)

 
;; for go
;;(add-to-list 'load-path "/usr/lib/go/src/pkg/github.com/dougm/goflymake/")
;;(require 'go-flymake)
;;(add-to-list 'exec-path (expand-file-name "/usr/lib/go/bin/"))



;; for color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)




;;;; This snippet enables lua-mode
;; This line is not necessary, if lua-mode.el is already on your load-path
(add-to-list 'load-path "~/emacs/.emacs.d/el-get/lua-mode/")

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))


(add-to-list 'load-path "~/emacs/.emacs.d/el-get/flymake-lua/")
(require 'flymake-lua)
(add-hook 'lua-mode-hook 'flymake-lua-load)

;;(setq (cons "/opt/local/bin" exec-path))



;; for erlang
;;(add-to-list 'load-path "~/emacs/.emacs.d/el-get/distel")
;(require 'distel)
;;(distel-setup)

;; for erlang
(setq load-path (cons "~/emacs/.emacs.d/el-get/erlware-mode" load-path))
(setq erlang-man-root-dir "/usr/local/otp")
(setq exec-path (cons "/opt/local/bin/" exec-path))
(require 'erlang-start)


;; for session
(setq load-path (cons "~/emacs/.emacs.d/el-get/session/lisp" load-path))
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(setq session-undo-check -1)

;; for helm
(setq load-path (cons "~/.emacs.d/el-get/helm" load-path))
(require 'helm-config nil t)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)
