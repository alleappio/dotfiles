  (use-package dired-open
  :config
  (setq dired-open-extensions '(("gif" . "sxiv")
  			      ("jpg" . "sxiv")
  			      ("png" . "sxiv")
  			      ("mkv" . "mpv")
  			      ("mp4" . "mpv"))))
  (use-package peep-dired
    :after dired
    :hook (evil-normalize-keymaps . peep-dired-hook))
(provide 'dired-setup)
