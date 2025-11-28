  (use-package dashboard
    :ensure t 
    :init
    (setq initial-buffer-choice 'dashboard-open)
    (setq dashboard-set-heading-icons t)
    (setq dashboard-set-file-icons t)
    (setq dashboard-banner-logo-title "Hello there!")
    ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
    (setq dashboard-startup-banner "/home/alle/.config/emacs/emacs_banner.txt")  ;; use custom image as banner
    (setq dashboard-center-content t) ;; set to 't' for centered content
    (setq dashboard-items nil)
    (setq dashboard-startupify-list '(dashboard-insert-banner
                                    dashboard-insert-newline
                                    dashboard-insert-banner-title
                                    dashboard-insert-newline
                                    dashboard-insert-navigator
                                    dashboard-insert-newline
  				  dashboard-insert-init-info
                                    dashboard-insert-newline))
    :custom
    (dashboard-modify-heading-icons '((recents . "file-text")
                                      (bookmarks . "book")))
    :config
    (dashboard-setup-startup-hook))

(provide 'dashboard-setup)
