
    (use-package doom-modeline
        :ensure t
        :init (doom-modeline-mode 1)
        :config
        (setq doom-modeline-height 10
            doom-modeline-bar-width 5
            doom.modeline-persp-name t
            doom-modeline-persp-icon t))

(provide 'modeline-setup)
