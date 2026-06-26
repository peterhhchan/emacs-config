;;; setup-python.el --- python setup for emacas


;;; Commentary:
;; TODO - Verify this setup

;;; Code:

(use-package elpy
  :init
  (elpy-enable)
  :config
  (setq
   elpy-rpc-python-command "python"
   elpy-shell-echo-output nil
   python-shell-interpreter "python"
   python-shell-interpreter-args "-i"
   elpy-rpc-virtualenv-path  'default
        ))

;;(use-package jupyter)


(use-package flycheck
  :init
  (setq elpy-modules (delq'elpy-module-flymake elpy-modules))
  (global-flycheck-mode))

(use-package py-autopep8)

;; (use-package pyvenv
;;   :ensure t
;;   :config
;;   (pyvenv-mode t)

;;   ;; Set correct Python interpreter
;;   (setq pyvenv-post-activate-hooks
;;         (list (lambda ()
;;                 (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python")))))
;;   (setq pyvenv-post-deactivate-hooks
;;         (list (lambda ()
;;                 (setq python-shell-interpreter "python")))))

(use-package blacken
  :ensure t
  :diminish)

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (add-hook 'python-mode-hook #'smartparens-mode))

(defun my/python-mode-hook ()
  (blacken-mode)
  (aggressive-indent-mode)
  (diminish 'flymake-mode))


(provide 'setup-python)

;;; setup-python.el ends here
