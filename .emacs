;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                              ;;
;;                   Custom file for emacs                      ;;
;;                                                              ;;
;;  @author : Gu�nol� LALLEMENT                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ==== Add by emacs ====

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(current-language-environment "French")
 '(custom-enabled-themes (quote (tango-dark)))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(minimap-always-recenter nil)
 '(minimap-automatically-delete-window nil)
 '(minimap-dedicated-window t)
 '(minimap-hide-fringes nil)
 '(minimap-major-modes (quote (prog-mode text-mode)))
 '(minimap-mode t)
 '(minimap-recenter-type (quote relative))
 '(minimap-width-fraction 0.1)
 '(minimap-window-location (quote right))
 '(safe-local-variable-values
   (quote
    ((c-file-offsets
      (innamespace . 0)
      (inline-open . 0))
     (checkdoc-permit-comma-termination-flag . t)
     (checkdoc-force-docstrings-flag))))
 '(show-paren-mode t)
 '(vhdl-upper-case-keywords t)
 '(vhdl-upper-case-types nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-font-face ((t (:height 70 :family "DejaVu Sans Mono")))))

;; ==== Disable init message ====
(setq inhibit-startup-message t)

;; ==== Add MELPA repo ====
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; ==== Modification for load-path ====
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;; ==== Enable Line and Column Numbering ====
(setq column-number-mode t)
(setq line-number-mode t)
(require 'linum)
(global-linum-mode t)
(setq linum-format "%4d ")

;; ===== Set standard indent to 4
(setq standard-indent 4)
(setq-default tab-width 4)
(setq-default py-indent-offset 4)

;; ==== Support Wheel Mouse Scrolling =====
(mouse-wheel-mode t)

;; ==== Line by line scrolling ====
;; This makes the buffer scroll by only a single line when the up or
;; down cursor keys push the cursor (tool-bar-mode) outside the
;; buffer. The standard emacs behaviour is to reposition the cursor in
;; the center of the screen, but this can make the scrolling confusing
(setq scroll-step 1)

;; ==== Tab using spaces ====
(setq-default indent-tabs-mode nil)

;; ==== Better buffer switching ====
(iswitchb-mode 1)

;; ==== Use font-lock-mode ====
(global-font-lock-mode 1)

;; ==== default to better frame titles ====
(setq frame-title-format (concat  "%b - emacs@" system-name))

;; ==== Custom for utf-8 ====
(setq locale-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; ==== Shortcut ====
(global-set-key (kbd "C-c h") 'replace-string)
(global-set-key (kbd "C-c j") 'replace-regexp)
(global-set-key (kbd "C-c o") 'bury-buffer)
(global-set-key (kbd "C-c k") 'kill-this-buffer)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c g") 'gdb)

;; ==== Custom for Mac OS X ====
(setq mac-command-modifier
      'meta) ; make cmd do Meta
(setq mac-option-modifier
      'nil) ; make opt do opt
(setq mac-control-modifier
      'control) ; make control key do Control
(setq mac-function-modifier
      'hyper) ; make Fn key do Hyper

;; ==== Autosave files ====

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.


;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

(setq version-control t ;; Use version numbers for backups
      kept-new-versions 16 ;; Number of newest versions to keep
      kept-old-versions 2 ;; Number of oldest versions to keep
      delete-old-versions t ;; Ask to delete excess backup versions?
      backup-by-copying-when-linked t) ;; Copy linked files, don't rename.

(defun force-backup-of-buffer ()
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook  'force-backup-of-buffer)

;; cleanup on return
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ==== make scripts executable ====
(add-hook 'after-save-hook
          '(lambda ()
             (if (not (executable-make-buffer-file-executable-if-script-p))
                 (normal-mode))))

;; ==== Custom for Octave ====
(setq auto-mode-alist
      (cons
       '("\\.m$" . octave-mode)
       auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

;; ==== Custom for SystemVerilog ====
(defun prepend-path ( my-path )
  (setq load-path (cons (expand-file-name my-path) load-path)))
(defun append-path ( my-path ) (setq load-path (append load-path (list (expand-file-name my-path)))))


;; Look first in the directory ~/emacs.d for elisp files
(prepend-path "~/emacs.d")
;; Load verilog mode only when needed
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
;; Any files that end in .v, .dv or .sv should be in verilog mode
(add-to-list 'auto-mode-alist '("\\.[ds]?v\\'" . verilog-mode))
;; Any files in verilog mode should have their keywords colorized
(add-hook 'verilog-mode-hook '(lambda () (font-lock-mode 1)))

;; ==== Custom for Python ====
(load-file "/Users/Gu3nol/.emacs.d/emacs_py/epy-init.el")

;;;
;;; VHDL Mode
;;;

;;(autoload 'vhdl-mode "vhdl-mode" "VHDL Mode" t)

;;(setq auto-mode-alist (cons '("\\.vhdl?$" . vhdl-mode) auto-mode-alist))

;;; Customizations for VHDL Mode

;;(custom-set-variables
;; enter customizations of VHDL Mode variables here


;;)

;; Custom to include /usr/textbin in the PATH env variable
(getenv "PATH")
;;(setenv "PATH" (concat "/usr/texbin" ":" (getenv "PATH")))
(setenv "PATH" (concat "/Library/TeX/texbin" ":" (getenv "PATH")))
;;(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/pdf2dsc"))

(setq flyspell-mode t)
(setq-default ispell-program-name "/opt/local/bin/aspell")
(setq-default ispell-list-command "list")

;; Aspell checking
(setq ispell-extra-args '("--sug-mode=fast"))

;; AucTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;; Use Skim as viewer, enable source <-> PDF sync
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))
(add-hook 'LaTeX-mode-hook (lambda () (local-set-key (kbd "<C-s-mouse-1>") #'TeX-view)))
;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

;; === Activate AC ===
(require 'package)
(package-initialize)

(require 'auto-complete)
(require 'auto-complete-auctex)
(require 'auto-complete-config)
(ac-config-default)


;;(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

;; (defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
;;   (setq ac-sources
;;         (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands) ac-sources)))
;;(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
(ac-flyspell-workaround)
(global-auto-complete-mode t)
;;(setq ac-math-unicode-in-math-p t)

;; easy spell check
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)
(global-set-key (kbd "C-$") 'flyspell-popup-correct)


;; Variable for tabbar
(global-set-key [M-left] 'tabbar-backward-tab)
(global-set-key [M-right] 'tabbar-forward-tab)
(global-set-key (kbd "C->") 'tabbar-forward-group)
(global-set-key (kbd "C-<") 'tabbar-backward-group)


(setq tabbar-ruler-global-tabbar t) ; If you want tabbar
;;  (setq tabbar-ruler-global-ruler t) ; if you want a global ruler
(setq tabbar-ruler-popup-menu t) ; If you want a popup menu.
(setq tabbar-ruler-popup-toolbar t) ; If you want a popup toolbar
(setq tabbar-ruler-popup-scrollbar t) ; If you want to only show the
                                        ; scroll bar when your mouse is moving.
(require 'tabbar-ruler)
