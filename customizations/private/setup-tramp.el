;;; setup-tramp.el --- python setup for emacas

;; tramp config
(setq tramp-default-method "ssh")

(put 'erase-buffer 'disabled nil)

(put 'downcase-region 'disabled nil)


(set-variable 'nrepl-use-ssh-fallback-for-remote-hosts "true")

(add-to-list 'tramp-remote-process-environment "CHROME_DRIVER_PATH=/home/ec2-user/resources/drivers/chromedriver")

(add-to-list 'tramp-remote-process-environment "CHROME_BIN_PATH=/usr/bin/google-chrome")

(add-to-list 'tramp-remote-process-environment "DISPLAY=:99")
