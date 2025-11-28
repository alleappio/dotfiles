  (set-face-attribute 'default nil
    :font "AdwaitaMono Nerd Font Mono"
    :height 110
    :weight 'medium)
  ;; Makes commented text and keywords italics.
  ;; This is working in emacsclient but not emacs.
  ;; Your font must have an italic face available.
  (set-face-attribute 'font-lock-comment-face nil
    :slant 'italic)
  (set-face-attribute 'font-lock-keyword-face nil
    :slant 'italic)

  ;; This sets the default font on all graphical frames created after restarting Emacs.
  ;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
  ;; are not right unless I also add this method of setting the default font.
  (add-to-list 'default-frame-alist '(font . "AdwaitaMono Nerd Font Mono-11"))

  ;; Uncomment the following line if line spacing needs adjusting.
  (setq-default line-spacing 0.12)

(provide 'fonts-settings)
