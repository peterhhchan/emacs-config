;; SQL
(use-package sqlup-mode
  :ensure t
  :diminish
  :init (setq sqlup-blacklist '("name" "id" "state" "result" "action"))
  :config (add-hook 'sql-mode-hook 'sqlup-mode))

(provide 'setup-sql)
