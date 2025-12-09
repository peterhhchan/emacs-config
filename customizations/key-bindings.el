;;; Package --- Personal Key Bindings

;;; Code:
;; https://www.reddit.com/r/emacs/comments/nlmff5/what_do_people_use_cz_for/
;; Use `fg` to return to emacs if suspended
(put 'suspend-frame 'disabled t)

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

(global-unset-key (kbd "C-s"))
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-<f3>") 'isearch-forward-regexp)


(global-set-key (kbd "C-S-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-)") 'paredit-forward-slurp-sexp)
(global-set-key (kbd "C-(") 'paredit-backward-slurp-sexp)


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

;;https://emacs.stackexchange.com/questions/10450/graphical-glitch-screen-tearing-in-emacs
(global-set-key (kbd "<f5>") 'redraw-display)
