;;; setup-python.el --- python setup for emacas


;;; Commentary:
;; TODO - Verify this setup

;;; Code:

(use-package elpy
  :init
  (elpy-enable)
  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt"
        elpy-rpc-python-command "python3"
        elpy-shell-echo-output nil

;;        python-shell-interpreter "python3"
;;W        python-shell-interpreter-args "-i"

;;        python-shell-interpreter "jupyter"
;;        python-shell-interpreter-args "console --simple-prompt"
;        python-shell-prompt-detect-failure-warning nil
        ))

(use-package jupyter)

;; Clean this up
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

(use-package flycheck
  :init
  (setq elpy-modules (delq'elpy-module-flymake elpy-modules))
  (global-flycheck-mode))

(use-package py-autopep8)

(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(use-package pyvenv)

(use-package blacken
  :ensure t
  :diminish)

(defun my/python-mode-hook ()
  (blacken-mode)
  (aggressive-indent-mode)
  (diminish 'flymake-mode))

;;(pyvenv-activate "~/anaconda3/envs/machine_learning")

;; Point elpy to the conda environments
;;(setenv "WORKON_HOME" "~/anaconda3/envs")
;;(pyvenv-mode 1)

(provide 'setup-python)

;;; setup-python.el ends here
