(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-s"))
(global-unset-key (kbd "C-S-<f3>"))

;; Hmm Do I need this one?
(global-set-key (kbd "C-`") 'kill-emacs)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-<f3>") 'isearch-forward)

(global-set-key (kbd "<C-iso-lefttab>") 'clojure-align)

(global-set-key (kbd "C-S-y") 'yank-pop)
;;(global-set-key (kbd "C-)") 'paredit-forward-slurp-sexp)
;;(global-set-key (kbd "C-(") 'paredit-backward-slurp-sexp)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(defun ambrevar/flyspell-and-whitespace-mode ()
  "Toggle `flyspell-mode' and `whitespace-mode'."
  (interactive)
  (if (derived-mode-p 'prog-mode)
      (flyspell-prog-mode)
    (flyspell-mode)
    (when flyspell-mode
      (flyspell-buffer)))
  (whitespace-mode 'toggle))

(global-set-key (kbd "<f9>") #'ambrevar/flyspell-and-whitespace-mode)
