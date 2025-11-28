  (use-package general
    :diminish
    :config
    (general-evil-setup)

    ;; set up 'SPC' as the global leader key
    (general-create-definer dt/leader-keys
      :states '(normal insert visual emacs)
      :keymaps 'override
      :prefix "SPC" ;; set leader
      :global-prefix "M-SPC") ;; access leader in insert mode

    (dt/leader-keys
      "." '(find-file :wk "find file")
      "fr" '(counsel-recentf :wk "find recent files")
      "TAB TAB" '(comment-line :wk "comment lines")) 

     (dt/leader-keys
      "b" '(:ignore t :wk "buffer")
      "bb" '(switch-to-buffer :wk "Switch buffer")
      "bi" '(ibuffer :wk "ibuffer")
      "bk" '(kill-current-buffer :wk "Kill current buffer")
      "bn" '(next-buffer :wk "Next buffer")
      "bp" '(previous-buffer :wk "Previous buffer")
      "br" '(revert-buffer :wk "Reload buffer"))

    (dt/leader-keys
      "e" '(:ignore t :wk "evaluate")
      "eb" '(eval-buffer :wk "evaluate elisp buffer")
      "ed" '(eval-defun :wk "evaluate defun")
      "ee" '(eval-expression :wk "evaluate expression")
      "el" '(eval-last-sexp :wk "evaluate expression before point")
      "er" '(eval-region :wk "evaluate region"))

    (dt/leader-keys
      "d" '(:ignore t :wk "dired")
      "dd" '(dired :wk "open dired")
      "dj" '(dired-jump :wk "dired jump to current")
      "dn" '(neotree-dir :wk "open directory in neotree"))

    (dt/leader-keys
        "h" '(:ignore t :wk "help")
        "hf" '(describe-function :wk "describe function")
        "hv" '(describe-variable :wk "describe variable")
        "hrr" '(reload-init-file :wk "reload init file"))

    (dt/leader-keys
        "t" '(:ignore t :wk "toggle")
        "tl" '(display-line-numbers-mode :wk "toggle line numbers")
        "tc" '(visual-line-mode :wk "toggle truncated lines")
        "tn" '(neotree-toggle :wk "toggle neotree")
        "tt" '(vterm-toggle :wk "toggle vterm")
        "tv" '(evil-mode :wk "toggle vim (evil) mode"))
    )

(provide 'general-keybindings-setup)
