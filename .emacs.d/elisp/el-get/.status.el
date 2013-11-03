((anything status "installed" recipe
	   (:name anything :website "http://www.emacswiki.org/emacs/Anything" :description "Open anything / QuickSilver-like candidate-selection framework" :type git :url "http://repo.or.cz/r/anything-config.git" :shallow nil :load-path
		  ("." "extensions" "contrib")
		  :features anything))
 (auto-complete status "installed" recipe
		(:name auto-complete :website "http://auto-complete.org/" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
		       (popup fuzzy)))
 (distel status "required" recipe nil)
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :features el-get :info "." :load "el-get.el"))
 (erlware-mode status "installed" recipe
	       (:name erlware-mode :description "Major modes for editing and running Erlang" :type http-tar :options
		      ("xzf")
		      :url "http://erlware-mode.googlecode.com/files/erlware-mode-0.1.19.tar.gz" :load "erlang-start.el"))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (ghc-mod status "installed" recipe
	  (:name ghc-mod :description "Happy Haskell programming" :type github :pkgname "kazu-yamamoto/ghc-mod" :load-path "elisp"))
 (go-mode status "installed" recipe
	  (:name go-mode :description "Major mode for the Go programming language" :type http :url "http://go.googlecode.com/hg/misc/emacs/go-mode.el?r=tip" :localname "go-mode.el" :features go-mode :post-init
		 (add-to-list 'auto-mode-alist
			      '("\\.go\\'" . go-mode))))
 (lua-mode status "installed" recipe
	   (:name lua-mode :description "A major mode for editing Lua scripts." :website "https://github.com/immerrr/lua-mode" :description "A major mode for editing Lua scripts." :type git :url "https://github.com/immerrr/lua-mode"))
 (popup status "installed" recipe
	(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :pkgname "auto-complete/popup-el")))
