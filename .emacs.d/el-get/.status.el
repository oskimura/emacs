((color-theme status "installed" recipe
	      (:name color-theme :description "An Emacs-Lisp package with more than 50 color themes for your use. For questions about color-theme" :website "http://www.nongnu.org/color-theme/" :type http-tar :options
		     ("xzf")
		     :url "http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz" :load "color-theme.el" :features "color-theme" :post-init
		     (progn
		       (color-theme-initialize)
		       (setq color-theme-is-global t))))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :features el-get :info "." :load "el-get.el"))
 (go-mode status "installed" recipe
	  (:name go-mode :description "Major mode for the Go programming language" :type http :url "http://go.googlecode.com/hg/misc/emacs/go-mode.el?r=tip" :localname "go-mode.el" :features go-mode :post-init
		 (add-to-list 'auto-mode-alist
			      '("\\.go\\'" . go-mode)))))
