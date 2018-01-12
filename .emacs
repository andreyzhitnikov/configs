;; init.el --- Emacs configuration     
                                                                                                                                                                                                           
;; INSTALL PACKAGES                                                                                                                                                                                        
;; --------------------------------------                                                                                                                                                                  
(require 'package)                                                                                                                                                                                         
                                                                                                                                                                                                           
(add-to-list 'package-archives                                                                                                                                                                             
       '("melpa" . "http://melpa.org/packages/") t)                                                                                                                                                        
                                                                                                                                                                                                           
(package-initialize)                                                                                                                                                                                       
                                                                                                                                                                                                          
(when (not package-archive-contents)                                                                                                                                                                       
  (package-refresh-contents))                                                                                                                                                                            
                                                                                                                                    
(defvar myPackages                                                                                                                                                                                        
  '(better-defaults                                                                                                                                                                                        
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
                                                                                                                                                                                               
;; init.el ends here   
