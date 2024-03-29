;;; Package --- Personal Key Bindings

;;; Code:
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-s"))
(global-unset-key (kbd "C-S-<f3>"))
(global-unset-key (kbd "C-S-y"))

;; I hate you mac!
(global-unset-key (kbd "s-x"))

;; Hmm Do I need this one?
;;(global-unset-key (kbd "C-`")) ;; unbind kill emacs
(global-unset-key (kbd "C--"))
(global-set-key (kbd "C--") 'pop-global-mark)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "C-x <C-up>") 'other-window)
(global-set-key (kbd "C-x <C-down>") 'other-window)
(global-set-key (kbd "C-s") 'save-buffer)

(global-set-key (kbd "C-S-<f3>") 'isearch-forward)


(global-set-key (kbd "C-S-y") 'helm-show-kill-ring)
;;(global-set-key (kbd "C-)") 'paredit-forward-slurp-sexp)
;;(global-set-key (kbd "C-(") 'paredit-backward-slurp-sexp)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;;(global-unset-key (kbd "C-x C-f"))
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)



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
