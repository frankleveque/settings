(setq gc-cons-threshold 100000000)

(global-linum-mode t)

(add-hook 'prog-mode-hook 'linum-mode)
(set-default 'truncate-lines t)

;; Enable backup files
(setq make-backup-files t)

;; auto reload files
(global-auto-revert-mode t)

;;set min window sizes
(setq window-min-height 0)
(setq window-min-width 0)

;; Tabs to spaces
(setq-default indent-tabs-mode nil)

;; Save all backup files to this directory
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

(set-fringe-mode '(0 . 0))

(setq-default c-basic-offset 4)
(setq c-default-style "k&r"
      c-basic-offset 4)

(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; 3 lines at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq scroll-conservatively  10000)

(setq inhibit-startup-screen t)
(setq initial-scratch-message "") 
(tool-bar-mode -1)
(toggle-scroll-bar -1)

(setq ring-bell-function 'ignore)
(setq completion-ignore-case t)
(prefer-coding-system 'utf-8)

(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-11:antialias=natural"))
(set-default-font "DejaVu Sans Mono-11:antialias=natural")


(defun display-startup-echo-area-message ()
  (message (concat "Startup in: " (emacs-init-time))))

(require 'package)

; list the repositories containing them
(setq package-archives
      '(("elpa" . "http://tromey.com/elpa/")
        ("melpa" . "http://melpa.milkbox.net/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "https://marmalade-repo.org/packages/")))


; list the packages you want
(setq package-list '(
                     molokai-theme evil slime 
                     lua-mode cmake-mode go-mode
		     markdown-mode
		     gitattributes-mode gitignore-mode gitconfig-mode 
                     json-mode jvm-mode python-mode 
                     ivy async
		     counsel
		     smex
		     flx
		     org
                     ))


; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "sbcl.exe")
(setq slime-contribs '(slime-fancy))

(load-theme 'molokai t)


(require 'evil)
(evil-mode 1)

(require 'ivy)
(ivy-mode 1)

(global-set-key (kbd "M-x") 'counsel-M-x)

; Slim down ivy display
(setq ivy-count-format ""
      ivy-display-style nil
      ivy-minibuffer-faces nil
      )

(setq ivy-re-builders-alist
      '((t . ivy--regex)))

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

(add-hook 'c++-mode-hook (lambda () (auto-complete-mode)))
(add-hook 'c-mode-hook (lambda () (auto-complete-mode)))

(setq gdb-many-windows t)

; Let ivy use flx for fuzzy-matching
(require 'flx)
(setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

; Use Enter on a directory to navigate into the directory, not open it with dired.
(define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)

