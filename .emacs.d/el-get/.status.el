((anything status "installed" recipe
           (:name anything :website "http://www.emacswiki.org/emacs/Anything" :description "Open anything / QuickSilver-like candidate-selection framework" :type git :url "http://repo.or.cz/r/anything-config.git" :shallow nil :load-path
                  ("." "extensions" "contrib")
                  :features anything))
 (anything-auto-install status "installed" recipe
                        (:name anything-auto-install :auto-generated t :type emacswiki :description "Integrate auto-install.el with anything.el" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/anything-auto-install.el"))
 (auto-complete status "installed" recipe
                (:name auto-complete :website "http://auto-complete.org/" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)))
 (auto-install status "installed" recipe
               (:name auto-install :description "Auto install elisp file" :type emacswiki))
 (color-theme status "installed" recipe
              (:name color-theme :description "An Emacs-Lisp package with more than 50 color themes for your use. For questions about color-theme" :website "http://www.nongnu.org/color-theme/" :type http-tar :options
                     ("xzf")
                     :url "http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz" :load "color-theme.el" :features "color-theme" :post-init
                     (progn
                       (color-theme-initialize)
                       (setq color-theme-is-global t))))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :features el-get :info "." :load "el-get.el"))
 (erlware-mode status "installed" recipe
               (:name erlware-mode :description "Major modes for editing and running Erlang" :type http-tar :options
                      ("xzf")
                      :url "http://erlware-mode.googlecode.com/files/erlware-mode-0.1.19.tar.gz" :load "erlang-start.el"))
 (expand-region status "installed" recipe
                (:name expand-region :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme" :features expand-region))
 (flycheck status "installed" recipe
           (:name flycheck :type github :pkgname "flycheck/flycheck"))
 (flymake-lua status "installed" recipe
              (:name flymake-lua :website "https://github.com/sroccaserra/emacs/blob/master/flymake-lua.el" :description "Flymake support for Lua." :type http :url "https://raw.github.com/sroccaserra/emacs/master/flymake-lua.el" :post-init
                     (add-hook 'lua-mode-hook 'flymake-lua-load)))
 (fringe-helper status "installed" recipe
                (:name fringe-helper :description "Helper functions for fringe bitmaps." :type http :url "http://nschum.de/src/emacs/fringe-helper/fringe-helper.el" :features fringe-helper))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (go-mode status "installed" recipe
          (:name go-mode :description "Major mode for the Go programming language" :type http :url "http://go.googlecode.com/hg/misc/emacs/go-mode.el?r=tip" :localname "go-mode.el" :features go-mode :post-init
                 (add-to-list 'auto-mode-alist
                              '("\\.go\\'" . go-mode))))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :features helm-config))
 (highlight-symbol status "installed" recipe
                   (:name highlight-symbol :description "Quickly highlight a symbol throughout the buffer and cycle through its locations." :type http :url "http://nschum.de/src/emacs/highlight-symbol/highlight-symbol.el" :features "highlight-symbol"))
 (js2-mode status "installed" recipe
           (:name js2-mode :website "https://github.com/mooz/js2-mode#readme" :description "An improved JavaScript editing mode" :type github :pkgname "mooz/js2-mode" :prepare
                  (autoload 'js2-mode "js2-mode" nil t)))
 (lua-mode status "installed" recipe
           (:name lua-mode :description "A major-mode for editing Lua scripts" :website "https://github.com/immerrr/lua-mode" :description "A major mode for editing Lua scripts." :type git :url "https://github.com/immerrr/lua-mode"))
 (multiple-cursors status "installed" recipe
                   (:name multiple-cursors :description "An experiment in adding multiple cursors to emacs" :type github :pkgname "magnars/multiple-cursors.el" :features multiple-cursors))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :pkgname "auto-complete/popup-el"))
 (revive status "installed" recipe
         (:name revive :description "Revive.el saves current editing status including the window splitting configuration, which can't be recovered by `desktop.el' nor by `saveconf.el', into a file and reconstructs that status correctly." :type http :url "http://www.gentei.org/~yuuji/software/revive.el" :features "revive"))
 (session status "installed" recipe
          (:name session :description "When you start Emacs, package Session restores various variables (e.g., input histories) from your last session. It also provides a menu containing recently changed/visited files and restores the places (e.g., point) of such a file when you revisit it." :type http-tar :options
                 ("xzf")
                 :load-path
                 ("lisp")
                 :url "http://downloads.sourceforge.net/project/emacs-session/session/2.2a/session-2.2a.tar.gz" :autoloads nil))
 (smartrep status "installed" recipe
           (:name smartrep :description "Support sequential operation which omitted prefix keys." :website "http://sheephead.homelinux.org/2011/12/19/6930/" :type github :pkgname "myuhe/smartrep.el" :features "smartrep"))
 (sml-mode status "installed" recipe
           (:name sml-mode :type github :pkgname "emacsmirror/sml-mode"))
 (windows status "installed" recipe
          (:name windows :description "Window manager for GNU Emacs." :type http :url "http://www.gentei.org/~yuuji/software/windows.el" :features "windows"))
 (yasnippet status "installed" recipe
            (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :features "yasnippet" :pre-init
                   (unless
                       (or
                        (boundp 'yas/snippet-dirs)
                        (get 'yas/snippet-dirs 'customized-value))
                     (setq yas/snippet-dirs
                           (list
                            (concat el-get-dir
                                    (file-name-as-directory "yasnippet")
                                    "snippets"))))
                   :post-init
                   (put 'yas/snippet-dirs 'standard-value
                        (list
                         (list 'quote
                               (list
                                (concat el-get-dir
                                        (file-name-as-directory "yasnippet")
                                        "snippets")))))
                   :compile nil :submodule nil)))
