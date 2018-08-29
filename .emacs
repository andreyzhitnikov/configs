;; init.el --- Emacs configuration     
                                                                                                                                                                                                         
;; INSTALL PACKAGES                                                                                                                                                                                        
;; --------------------------------------

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;(package-initialize)
(unless package--initialized (package-initialize t))                                                                                                                                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                        
(when (not package-archive-contents)                                                                                                                                                                       
  (package-refresh-contents))                                                                                                                                                                            
                                                                                                                                    
(defvar myPackages                                                                                                                                                                                        
  '(better-defaults
    neotree
    ggtags
    helm
    helm-bibtex
    elpy ;; add the elpy package
    flycheck;; add the flycheck package
    company
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


	                                                                                                                                                                                     
;; Tell emacs where is your personal elisp lib dir
;;(add-to-list 'load-path "~/.emacs.d/lisp/")




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

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;;(setq company-backends (delete 'company-semantic company-backends))


(setq-local imenu-create-index-function #'ggtags-build-imenu-index)


;; Enable EDE (Project Management) features
(global-ede-mode 1)
;;(global-srecode-minor-mode 1)            ; Enable template insertion menu



(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(add-to-list 'load-path "/home/blink/julia-emacs/")
(require 'julia-mode)

(setq-default neo-show-hidden-files t)

