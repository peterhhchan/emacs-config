;;; setup-python.el --- python setup for emacas


;;; Commentary:
;; TODO - Verify this setup

;;; Code:

(use-package elpy
  :init
  (elpy-enable))

(use-package flycheck
  :init
  (setq elpy-modules (delq'elpy-module-flymake elpy-modules))
  (global-flycheck-mode))

(use-package py-autopep8)

(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(use-package pyvenv)



;;(pyvenv-activate "~/anaconda3/envs/machine_learning")

;; Point elpy to the conda environments
;;(setenv "WORKON_HOME" "~/anaconda3/envs")
;;(pyvenv-mode 1)

(provide 'setup-python)

;;; setup-python.el ends here
