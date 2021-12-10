;;; setup-rust.el ---
;; TODO - move this to a global location?

;;; Commentary:
;; Uses rustic instead of rust-mode

;; Prereqs:
;; Install nightly toolchain
;; https://github.com/emosenkis/esp-rs/issues/10
;; > rustup toolchain install nightly

;; This may not be necessary
;; https://github.com/brotzeit/rustic#clippy
;; > rustup component add --toolchain nightly clippy

;;; Code:
;; https://www.reddit.com/r/rust/comments/a3da5g/my_entire_emacs_config_for_rust_in_fewer_than_20/

(use-package company
  :hook (prog-mode . company-mode)
  :config ((setq company-tooltip-align-annotations t)
           (setq company-minimum-prefix-length 1)))

(use-package dash)
(use-package lsp-ui)

;;https://emacs-lsp.github.io/lsp-mode/page/installation/
;; lsp-mode provides integration with rust-analyzer
(use-package lsp-mode
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  ((lsp-rust-analyzer-cargo-watch-command "clippy")
   (lsp-eldoc-render-all t)
   (lsp-idle-delay 0.6)
   (lsp-rust-analyzer-server-display-inlay-hints t))

  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))



(use-package toml-mode)


;; https://robert.kra.hn/posts/2021-02-07_rust-with-emacs/
(use-package rustic
  :requires flycheck
  :ensure t
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  ((setq rustic-format-on-save t)

   (add-hook 'rustic-mode-hook 'electric-pair-mode)
   (add-hook 'rustic-mode-hook 'flycheck-mode)
   (add-hook 'rustic-mode-hook 'paredit-mode)
   (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook)))


(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t)))

;; (use-package cargo
;;   :hook (rust-mode . cargo-minor-mode))

;;(use-package flycheck)

;; (use-package flycheck-rust
;; ;;  :requires flycheck
;;   :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(provide 'setup-rust)

;;; setup-rust.el ends here
