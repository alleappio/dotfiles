(use-package evil
    :init
	(setq evil-want-integration t)
	(setq evil-want-keybinding nil)
	(setq evil-vsplit-window-right t)
	(setq evil-split-window-below t)
	(evil-mode))
(use-package evil-collection
    :after evil
    :config
	(setq evil-collection-mode-list '(dashboard dired ibuffer))
	(evil-collection-init))

(use-package evil-tutor)

(provide 'evil-setup)
