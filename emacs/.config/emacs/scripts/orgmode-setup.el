;; Enabling Table of Contents
(use-package toc-org
    :commands toc-org-enable
    :diminish
    :init (add-hook 'org-mode-hook 'toc-org-enable))

;; Enabling Org Bullets
;; Org-bullets gives us attractive bullets rather than asterisks.

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; disabling elctric indent
(electric-indent-mode -1)

(require 'org-tempo)

(provide 'orgmode-setup)
