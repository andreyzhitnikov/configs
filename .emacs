;; init.el --- Emacs configuration     
                                                                                                                                                                                                           
;; INSTALL PACKAGES                                                                                                                                                                                        
;; --------------------------------------                                                                                                                                                                  
(require 'package)
;;(require 'notmuch)


                                                                                                                                                                                                           
(add-to-list 'package-archives                                                                                                                                                                             
       '("melpa" . "http://melpa.org/packages/") t)                                                                                                                                                        
                                                                                                                                                                                                           
(package-initialize)                                                                                                                                                                                       
                                                                                                                                                                                                          
(when (not package-archive-contents)                                                                                                                                                                       
  (package-refresh-contents))                                                                                                                                                                            
                                                                                                                                    
(defvar myPackages                                                                                                                                                                                        
  '(better-defaults
    neotree
    helm
    helm-bibtex
    elpy ;; add the elpy package
    pdf-tools
    which-key
    try
    use-package
    auctex
    projectile
    popwin
    material-theme))                                                                                                                                                                                       


(mapc #'(lambda (package)                                                                                                                                                                                  
    (unless (package-installed-p package)                                                                                                                                                                 
      (package-install package)))                                                                                                                                                                          
      myPackages)                                                                                                                                                                               
                                                                                                                                                                                                          
;; BASIC CUSTOMIZATION                                                                                                                                                                                     
;; --------------------------------------                                                                                                                                                                 
(setq inhibit-startup-message t) ;; hide the startup message                                                                                                                                               
(load-theme 'material t) ;; load material theme                                                                                                                                                           
;;(global-linum-mode t) ;; enable line numbers globally

(add-hook 'prog-mode-hook 'linum-mode)


(elpy-enable)

;; auctex


(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook (lambda() (local-set-key [C-tab] 'TeX-complete-symbol)))

(pdf-tools-install)
;;(setq bidi-display-reordering t)
;;(setq bidi-paragraph-direction 'right-to-left)
(setq visual-order-cursor-movement t)
;; init.el ends here   
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(safe-local-variable-values (quote ((TeX-master . t))))
 '(show-paren-mode t)
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun toggleHebrew ()
  (interactive)
  (setq bidi-paragraph-direction  'right-to-left ))

(defun toggleEnglish ()
  (interactive)
  (setq bidi-paragraph-direction  'left-to-right ))

;;try out packages
(use-package try
	     :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(setq projectile-tags-command "etags -a TAGS \"%s\"")

;; -----mail config----
;;(add-to-list 'load-path "~/mu/mu4e")
(autoload 'notmuch "notmuch" "notmuch mail" t)
;; setup the mail address and use name
(setq mail-user-agent 'sendmail-user-agent) ;;message-user-agent)
(setq user-mail-address "andreyz@campus.technion.ac.il"
      user-full-name "andreyz")
;; smtp config
(setq smtpmail-smtp-server  "smtp-mail.outlook.com" 
      ;;message-send-mail-function 'message-smtpmail-send-it
      send-mail-function    'smtpmail-send-it
      smtpmail-stream-type  'starttls
      smtpmail-smtp-service 587)
(setq mail-self-blind t)
;; use msmtp
;; (setq message-send-mail-function 'message-send-mail-with-sendmail)
;; (setq sendmail-program "/usr/bin/msmtp")


;; report problems with the smtp server
(setq smtpmail-debug-info t)
;; add Cc and Bcc headers to the message buffer
(setq message-default-mail-headers "Cc: \nBcc: \n")
;; postponed message is put in the following draft directory
(setq message-auto-save-directory "~/Maildir/draft")
(setq message-kill-buffer-on-exit t)
;; change the directory to store the sent mail
(setq message-directory "~/Maildir/")

;; predictive install location
(add-to-list 'load-path "~/.emacs.d/predictive/")
;; dictionary locations
(add-to-list 'load-path "~/.emacs.d/predictive/latex/")
(add-to-list 'load-path "~/.emacs.d/predictive/texinfo/")
(add-to-list 'load-path "~/.emacs.d/predictive/html/")
(set-default 'predictive-auto-add-to-dict t)
(setq predictive-auto-learn t
      predictive-add-to-dict-ask nil
      predictive-use-auto-learn-cache nil
      predictive-which-dict t)
(require 'predictive)




