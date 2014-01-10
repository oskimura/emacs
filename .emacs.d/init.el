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

;; ^hでBack Space
(global-set-key "\C-h" 'delete-backward-char)

;; インデントを4のホワイトスペースにする
(setq-default indent-tabs-mode nil)
(setq-default tab-width)

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
;;auto install el-get.el
(setq el-get-sources
      '((:name auto-highlight-symbol
               :type github
               :pkgname "emacsmirror/auto-highlight-symbol")

	(:name emacs-git-gutter-fringe
               :type github
               :pkgname "syohex/emacs-git-gutter-fringe")
	(:name emacs-git-gutter
	       :type github
               :pkgname "syohex/emacs-git-gutter")

	(:name anything-git-files
	       :type github
	       :pkgname "tarao/anything-git-files-el"
	       :depends anything)
	(:name exec-path-from-shell
	       :type github
	       :pkgname "purcell/exec-path-from-shell")
        	(:name init-loader
	       :type github
	       :pkgname "emacs-jp/init-loader")
	 ))

(defvar my/el-get-packages
  '(
    ;; package list
    session
    helm
    revive
    multiple-cursors
    expand-region
    smartrep
    highlight-symbol
    ;;emacs-git-gutter
    ;;fringe-helper
    ;;emacs-git-gutter-fringe
    ;;auto-highlight-symbol
    ;;anything-git-files
    ;;exec-path-from-shell
    ;;init-loader
    auto-complete
    yasnippet
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


;; for multiple-cursors, expand-region, smartrep
(require 'expand-region)
(require 'multiple-cursors)
(require 'smartrep)

(global-set-key (kbd "C-,") 'er/expand-region)
(global-set-key (kbd "C-M-,") 'er/contract-region)

(global-set-key (kbd "<C-M-return>") 'mc/edit-lines)
(smartrep-define-key
 global-map "C-." '(("C-n" . 'mc/mark-next-like-this)
                    ("C-p" . 'mc/mark-previous-like-this)
                    ("*"   . 'mc/mark-all-like-this)))


(require 'highlight-symbol)
(global-set-key (kbd "<f3>") 'highlight-symbol-at-point)
(global-set-key (kbd "M-<f3>") 'highlight-symbol-remove-all)
(setq load-path (cons "~/.emacs.d/el-get/auto-highlight-symbol" load-path))
(require 'auto-highlight-symbol-config)

;; for git-gutter fringe-helper git-gutter-fringe
(setq load-path (cons "~/.emacs.d/el-get/emacs-git-gutter" load-path))
(require 'git-gutter)
(global-git-gutter-mode t)

(setq load-path (cons "~/.emacs.d/el-get/fringe-helper" load-path))
(setq load-path (cons "~/.emacs.d/el-get/emacs-git-gutter-fringe" load-path))

(require 'git-gutter-fringe)
(global-git-gutter-mode)

;; for anything-git-files
(setq load-path (cons "~/.emacs.d/el-get/anything-git-files" load-path))
(require 'anything-git-files)

;; for exec-path-from-shell
(setq load-path (cons "~/.emacs.d/el-get/exec-path-from-shell" load-path))
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; for init-loader
(setq load-path (cons "~/.emacs.d/el-get/init-loader" load-path))
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
;; エラーが起きたときにどのファイルにエラーがあるか特定できます
(defun init-loader-re-load (re dir &optional sort)
  (let ((load-path (cons dir load-path)))
    (dolist (el (init-loader--re-load-files re dir sort))
      (condition-case e
          (let ((time (car (benchmark-run (load (file-name-sans-extension el))))))
            (init-loader-log (format "loaded %s. %s" (locate-library el) time)))
        (error
         ;; (init-loader-error-log (error-message-string e)) ；削除
         (init-loader-error-log (format "%s. %s" (locate-library el) (error-message-string e))) ;追加
         )))))

;; for auto-complete
(setq load-path (cons "~/.emacs.d/el-get/auto-complete" load-path))
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-completion-mode/dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; for yasnippet
(setq load-path (cons "~/.emacs.d/el-get/yasnippet" load-path))
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippet/snippets"
        "~/.emacs.d/el-get/yasnippet/snippets"))
(yas-global-mode 1)
(custom-set-variables '(yas-trigger-key "TAB"))
