  (use-package lua-mode)
  (use-package haskell-mode)
  (use-package rust-mode)
  (use-package markdown-mode
    :ensure t
    :mode ("README.md" . gfm-mode)
    :init (setq markdown-command "multimarkdown"))

(provide 'language-support)
