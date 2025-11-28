;; Disable menubar, toolbar and scrollbars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; display line numbers and truncated lines
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

;; welcome screen
(setq inhibit-startup-screen t)

;; scroll margin
(setq scroll-margin 15)
(setq scroll-conservatively 101)
(setq scroll-step 1)
(setq next-line-add-newlines nil)

;; tabs
(setq indent-tabs-mode nil)

(provide 'ui-settings)
