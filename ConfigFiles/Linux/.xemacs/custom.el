; POUR JDE/JAVA
;/usr/local/lib/xemacs/xemacs-packages/lisp
;# ln -s ../etc/jde/java .                                                                         
; POUR ACCELERER LE LANCEMENT (linuxfr)
;1) # touch /etc/mailname
;2) au *début* du .emacs (modify-frame-parameters nil '((wait-for-wm . nil)))
;3) dans une session emacs C-u 0 M-x byte-recompile-directory

; Ce qui vient de me sauver. Emacs interroge le wm au démarrage. Si ce
; dernier ne répond pas emacs attend du coup, parfois longtemps. Avec
; ceci il n'attend plus.
(modify-frame-parameters nil '((wait-for-wm . nil)))



;---
;; UTF-8
;(require 'un-define)
;(set-coding-priority-list '(utf-8))
;(set-coding-category-system 'utf-8 'utf-8)

; Possible completions are printed in the mini-buffer 
(require 'iswitchb) 
;--- 
; Locating wordlists for ispell-complete-word 
; aspell --lang fr dump master > words.fr.pt.uk 
; aspell --lang pt dump master >> words.fr.pt.uk 
; aspell --lang en dump master >> words.fr.pt.uk 
(setq ispell-alternate-dictionary "/usr/local/share/dict/words.fr.pt.uk") 
;--- 




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                       GLOBAL BEHAVIOUR OF XEMACS                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Add local packages path to the auto load-path
(add-to-list 'load-path "~/.xemacs/addons/")
(add-to-list 'load-path "~/.xemacs/addons/C#")
(add-to-list 'load-path "~/.xemacs/addons/icicles")

; Prevent narrowing to a region? Why? Useful?
(put 'narrow-to-region 'disabled nil)

; Possible completions of commands in the mini-buffer
(icomplete-mode)

; Possible completions of files in the mini-buffer
;; DOES NOT WORK WELL 
;;(require 'ido)
;;(ido-mode t)

; Enabling the use of the mouse wheel
(autoload 'mwheel-install "mwheel" "Enable mouse wheel support.") ; 
(mwheel-install)

(custom-set-variables
 '(LaTeX-eqnarray-label "Equation:")
 '(LaTeX-equation-label "Equation:")
 '(LaTeX-figure-label "Figure:")
 '(LaTeX-float "")
 '(LaTeX-item-indent 0)
 '(LaTeX-mode-hook (quote (reftex-mode turn-on-auto-fill flyspell-mode)))
 '(LaTeX-section-label (quote (("part" . "Part:") ("chapter" . "Chapter:") ("section" . "Section:") ("subsection" . "SSection:") ("subsubsection" . "SSSection:"))))
 '(LaTeX-table-label "Table:")
 '(TeX-PDF-mode t)
 '(TeX-file-extensions (quote ("tex" "sty" "cls" "ltx" "texi" "texinfo" "dtx" "tikz")))
 '(calc-gnuplot-name "/usr/local/bin/gnuplot" t)
 '(column-number-mode t)
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(ediff-cmp-options nil)
 '(ediff-diff-options "-a")
 '(global-font-lock-mode t nil (font-lock))
 '(kept-new-versions 10)
 '(kept-old-versions 10)
 '(line-number-mode t)
 '(paren-mode (quote sexp) nil (paren))
 '(pui-package-install-dest-dir "/usr/local/lib/xemacs/")
 '(query-user-mail-address nil)
 '(toolbar-visible-p nil)
 '(user-mail-address "liar@noaddress.org")
 '(version-control t))

; A macro to comment a region whathever the current mode
(defun uncomment-region (beg end)
  "Uncomment a region of text"
  (interactive "r")
  (comment-region beg end -1));

; Some useful key associations
(global-set-key [f4] (quote toggle-language))
(global-set-key [f5] (quote ispell-buffer))
(global-set-key [f6] (quote ispell-continue))

(global-set-key [f8] (quote mylatexmode))
(global-set-key [f9] (quote dabbrev-expand))
(global-set-key [f10] (quote compile))

(global-set-key [f11] (quote comment-region))
(global-set-key [f12] (quote uncomment-region))

; Default coding systems
;(set-file-coding-system 'no-conversion)
;(set-default-file-coding-system 'no-conversion)
;(setq file-coding-system 'no-conversion)
;(setq default-buffer-file-coding-system 'no-conversion)
;;(add-hook 'latex-mode-hook 'set-buffer-file-coding-system 'no-conversion)
;;(add-hook 'tex-mode-hook 'set-buffer-file-coding-system 'no-conversion)

; plante dans Open4.8
;(set-file-coding-system 'utf-8)
;(set-default-file-coding-system 'utf-8)
;(setq file-coding-system 'utf-8)
;(setq default-buffer-file-coding-system 'utf-8)
;(add-hook 'text-mode-hook 'set-buffer-file-coding-system 'utf-8)
;(add-hook 'text-mode-hook 'set-file-coding-system 'utf-8)
;(add-hook 'text-mode-hook 'set-default-file-coding-system 'utf-8)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                  FONTS                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-faces
 '(default ((t (:size "13pt" :family "Fixed"))) t)
 '(bold ((t (:size "14" :family "helvetica" :bold t))) t)
 '(bold-italic ((t (:size "14" :family "helvetica" :bold t :italic t))) t)
 '(font-latex-bold-face ((((class color) (background light)) (:foreground "DarkOliveGreen" :size "13" :bold t))))
 '(font-latex-italic-face ((((class color) (background light)) (:foreground "DarkOliveGreen" :size "13" :italic t))))
 '(italic ((nil (:family "helvetica" :bold nil :italic t))) t))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                         EDIFF MODE                                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 '(ediff-cmp-options nil)
 '(ediff-diff-options "-a")
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                        GNUPLOT MODE                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 '(calc-gnuplot-name "/usr/local/bin/gnuplot" t)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                        C SHARP MODE                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(load "csharp-mode.el")
;;(load "hide-show-csharp.el")
;;(load "flymake.el")
;;(load "flymake-for-csharp.el")
;;(load "yasnippet-bundle.el")
;;;(load "csde.el")
;;;(load "/usr/local/lib/xemacs/xemacs-packages/lisp/vm/vm.el")
;;;(load "/usr/local/lib/xemacs/xemacs-packages/lisp/gnus/mm-bodies.el")
;;;(load "/usr/local/lib/xemacs/xemacs-packages/lisp/x-symbol/x-symbol.el")

(defun mycsharp ()
;  (require 'un-define)
;  (set-coding-priority-list '(utf-8))
;  (set-coding-category-system 'utf-8 'utf-8)
;;  (require 'flymake-for-csharp)
;;  (flymake-mode)
  (hs-minor-mode 1)
  (setq hs-isearch-open t)
  (local-set-key "\C-c>"  'hs-hide-block)
  (local-set-key "\C-c<"  'hs-show-block)
;  (local-set-key "\C-w>" 'hs-hide-all)
;  (local-set-key "\C-w<" 'hs-show-all)
)
(add-hook 'csharp-mode-hook 'mycsharp)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                        GROOVY MODE                                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.groovy$" . java-mode))
;(setq matlab-mode-hook 'my-matlab-mode-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                          TEXT MODE                                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Allow accentuated characters
;(defun myctextmode ()
;  (set-buffer-file-coding-system 'no-conversion); 'ctext,'no-conversion,'raw-text,'undecided,'iso-8859-1
;)
;(add-hook 'text-mode-hook 'myctextmode) ; no-conversion,raw-text,undecided,utf-8,iso-8859-1,ctext
;(add-hook 'text-mode-hook 'turn-on-auto-fill) ; Auto-fill-mode automatique




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                         LATEX MODE                                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; From the manual
;(load "auctex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(require 'tex-site)  ; make the LaTeX menu appear when loading .tex files
;;(add-to-list 'auto-mode-alist '("\\.tikz$" . LaTeX-mode)) ; directly added the extension .tikz into the AucTeX configuration option

(outline-minor-mode) ; use C-c @ C-XXX commands to see outline of the document 

(custom-set-variables
 '(LaTeX-eqnarray-label "Equation:")
 '(LaTeX-equation-label "Equation:")
 '(LaTeX-figure-label "Figure:")
 '(LaTeX-float "")
 '(LaTeX-section-label (quote (("part" . "Part:") ("chapter" . "Chapter:") ("section" . "Section:") ("subsection" . "SSection:") ("subsubsection" . "SSSection:"))))
 '(LaTeX-table-label "Table:")
 '(TeX-PDF-mode t)
 '(LaTeX-mode-hook '(reftex-mode turn-on-auto-fill flyspell-mode))   ; loads references management tools, management of auto-fill for paragraphs and live check spelling
 '(TeX-file-extensions (quote ("tex" "sty" "cls" "ltx" "texi" "texinfo" "dtx" "tikz")))
)
(add-to-list 'auto-mode-alist '("\\.tikz$" . LaTeX-mode)) ; adds the extension .tikz as a LaTeX mode extension 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                         ASPELL MODE                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default ispell-program-name "aspell")
(setq current-language 1)
(ispell-change-dictionary "british")

(defun set-language-english ()
;Set english as ispell language
  (setq current-language 1)
  (ispell-change-dictionary "british")
  (force-mode-line-update)
  (setq sentence-end "[.?!][]\"')}]*\\($\\| $\\|\t\\|  \\)[ \t\n]*");
  (setq sentence-end-double-space t)
)

(defun set-language-french ()
;Set french as ispell language
  (setq current-language 0);
  (ispell-change-dictionary "francais");
  (force-mode-line-update);
  (setq sentence-end "[.?!][]\"')}]*\\($\\| $\\|\t\\|  \\)[ \t\n]*");
  (setq sentence-end-double-space t)
)
	 
(defun toggle-language ()
  "Toggle language between french/english"
  (interactive)
  (cond ((eq current-language 1)
	 (set-language-french))
	((eq current-language 0)
         (set-language-english))
	(t (set-language-french))
   )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                             R MODE                                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(load "/home/guigui/.xemacs/addons/ess-5.13/lisp/ess-site.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                MAKE BACKUPS IN A GLOBAL DIRECTORY                  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'backup-dir)
(setq bkup-backup-directory-info '( (t "~/.xemacs_backup/" full-path prepend-name search-upward)))
(setq version-control 3)
(setq kept-new-versions 5)
(setq kept-old-versions 0)


