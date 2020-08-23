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

;; Define package repositories
;;(require 'package)

;; (setq package-archives
;;       '(("MELPA Stable" . "https://stable.melpa.org/packages/")
;;         ("MELPA"        . "https://melpa.org/packages/")
;;         ("tromey"       . "http://tromey.com/elpa"))
;;       package-archive-priorities
;;       '(("MELPA Stable" . 10)
;;         ("MELPA"        . 0)
;;         ("tromey"       . 0)))

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
;;(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
;; (when (not package-archive-contents)
;;   (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    clj-refactor

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

    ;;
    ;; Python stuff
    ;;
    elpy ;; add the elpy package

))

(dolist (p my-packages)
  (straight-use-package p))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

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
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-python.el")

;; Key bindings
(load "key-bindings.el")

;; Whitespace
(load "whitespace.el")

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


;; tramp config
(setq tramp-default-method "ssh")
(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)


(require 'helm-config)
;;(global-company-mode)
