;;; setup-go.el

;; https://dr-knz.net/a-tour-of-emacs-as-go-editor.html
;; TODO - get yasnippet autocompletions working
;; TODO - why doesnt paredit work with curly braces?

(use-package go-mode)

(add-hook 'go-mode-hook (lambda ()
    (setq tab-width 4)))

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)))


(provide 'setup-go)
;;; setup-go.el ends here
