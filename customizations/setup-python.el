(require 'elpy)
(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(add-hook 'clojure-mode-hook 'enable-paredit-mode)

(require 'pyvenv)
(pyvenv-activate "~/anaconda3/envs/machine_learning")
;; Point elpy to the conda environments
;;(setenv "WORKON_HOME" "~/anaconda3/envs")
;;(pyvenv-mode 1)
