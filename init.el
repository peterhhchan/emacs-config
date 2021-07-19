;;;;
;; Packages
;;;;

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;;
    helm
    helm-projectile

    exec-path-from-shell

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-completing-read+

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile


    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    unicode-fonts

    ;; git integration
    magit

    ;; use-package macro
    ;; https://github.com/jwiegley/use-package
    use-package

    ;;
    ;; Python stuff
    ;;
    elpy ;; add the elpy package
))

(dolist (p my-packages)
  (straight-use-package p))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; https://github.com/raxod502/straight.el#integration-with-use-package
;;Specifying :straight t is unnecessary if you set
;;straight-use-package-by-default to a non-nil value. (Note that the
;;variable use-package-always-ensure is associated with package.el,
;;and you should not use it with straight.el.)

(setq straight-use-package-by-default t)
;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/customizations/private")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "my-misc.el")

;; For editing lisps
(load "elisp-editing.el")

(load "seq-25.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-python.el")
(load "setup-rust.el")

;; Key bindings
(load "key-bindings.el")

(load "setup-tramp.el")


(add-hook 'before-save-hook 'whitespace-cleanup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(package-selected-packages
   (quote
    (py-autopep8 flycheck clj-refactor exec-path-from-shell elpy multiple-cursors magit tagedit rainbow-delimiters projectile smex helm clojure-mode-extra-font-locking clojure-mode paredit))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:foreground "olive drab")))))


;;(global-company-mode)
