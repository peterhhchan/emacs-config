;;; setup-clojure.el --- Clojure setup

;;;

;; Mobot
;;(setenv "JAVA_HOME" "/Library/Java/JavaVirtualMachines/adoptopenjdk-15.jdk/Contents/Home")
(setenv "JAVA_HOME" "/opt/homebrew/opt/openjdk/bin/java")

(use-package cider)

;; key bindings and code colorization for Clojure
;; https://github.com/clojure-emacs/clojure-mode
(use-package clojure-mode
  :config
  ;; Enable paredit for Clojure
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)

  ;; This is useful for working with camel-case tokens, like names of
  ;; Java classes (e.g. JavaClassName)
  (add-hook 'clojure-mode-hook 'subword-mode)

  (add-hook 'clojure-mode-hook 'company-mode-on)

  (add-hook 'clojure-mode-hook
            (lambda ()
;;              (clj-refactor-mode 1)
              (yas-minor-mode 1) ; for adding require/use/import statements
              ;; This choice of keybinding leaves cider-macroexpand-1 unbound
;;              (cljr-add-keybindings-with-prefix "C-c C-m")
              ))

  ;; syntax hilighting for midje
  (add-hook 'clojure-mode-hook
            (lambda ()
              (setq inferior-lisp-program "lein repl")
              (font-lock-add-keywords
               nil
               '(("(\\(facts?\\)"
                  (1 font-lock-keyword-face))
                 ("(\\(background?\\)"
                  (1 font-lock-keyword-face))))
              (define-clojure-indent (fact 1))
              (define-clojure-indent (facts 1))))
)


;; A little more syntax highlighting
(use-package clojure-mode-extra-font-locking)
(setq font-lock-maximum-size 1000)

;; clj-refactor why you break everything always?
;;(use-package clj-refactor)


;;;;
;; Cider
;;;;

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'eldoc-mode)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)


;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
;;(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))


;; key bindings
;; these help me out with the way I usually develop web apps
(defun cider-start-http-server ()
  (interactive)
  (cider-load-current-buffer)
  (let ((ns (cider-current-ns)))
    (cider-repl-set-ns ns)
    (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
    (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))


(defun cider-refresh ()
  (interactive)
  (cider-interactive-eval (format "(user/reset)")))

(defun cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))

(eval-after-load 'cider
  '(progn
     (define-key clojure-mode-map (kbd "<C-iso-lefttab>") 'clojure-align)
     (define-key clojure-mode-map (kbd "C-c C-v") 'cider-start-http-server)
     (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
     (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
     (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)))


(provide 'setup-clojure)

;;; setup-clojure.el ends here
