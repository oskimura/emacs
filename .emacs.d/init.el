(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/")
	(expand-file-name "~/.emacs.d/elisp/el-get/el-get/")
	(expand-file-name "~/.emacs.d/elisp/el-get/go-mode/")
	(expand-file-name "~/.emacs.d/el-get/color-theme")
        (expand-file-name "~/.emacs.d/el-get/"))
       load-path))

(require 'el-get)

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



(load "~/.emacs.d/haskell-mode/haskell-site-file")

(add-to-list 'load-path "~/.emacs.d/haskell-mode")
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

(add-to-list 'load-path "~/.emacs.d")
(require 'auto-save-buffers)
(run-with-idle-timer 1 t 'auto-save-buffers)

;; for color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)


;; for go
;;(add-to-list 'load-path "/usr/lib/go/src/pkg/github.com/dougm/goflymake/")
;;(require 'go-flymake)
;;(add-to-list 'exec-path (expand-file-name "/usr/lib/go/bin/"))
