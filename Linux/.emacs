;; Add the MELPA repository, mainly to get up-to-date JDEE
;; From: https://melpa.org/#/getting-started
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             ;'("melpa-stable" . "https://stable.melpa.org/packages/") t) ; for stable packages only
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize) ;; You might already have this line

;; Make dabbrev be case sensitive
(setq dabbrev-case-fold-search "case-fold-search")
(setq dabbrev-case-replace nil)  ;; (setq dabbrev-case-replace true)
;; Manage aspell
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

;; A macro to move quickly within a page
(defun moveup ()
  "move 5 lines up"
  (interactive)
  (previous-line)
  (previous-line)
  (previous-line)
  (previous-line)
  (previous-line)
)
;; A macro to move quickly within a page
(defun movedown ()
  "move 5 lines down"
  (interactive)
  (next-line)
  (next-line)
  (next-line)
  (next-line)
  (next-line)
)
;; A macro to imitate CTL-ALT-up of Xemacs
(defun moveupc ()
  "move 5 lines up and recenter"
  (interactive)
  (moveup)
  (recenter)
)
;; A macro to imitate CTL-ALT-down of Xemacs
(defun movedownc ()
  "move 5 lines down and recenter"
  (interactive)
  (movedown)
  (recenter)
)

;; Disable auto-indentation in fundamental&org modes
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;; M-Del delete word, does not go to next parenthesis!
(global-unset-key "\C-\M-d")
(global-set-key "\C-d" 'delete-char)
(global-set-key "\C-\M-d" 'kill-word)
; DOES NOT WORK if .Xresources is not configured to send C-tab
(global-set-key [(control tab)] 'other-window) ; without screen
(global-set-key "[27;5;9~" 'other-window)    ; within screen

(global-set-key (kbd "C-M-<up>") (quote moveupc))
(global-set-key (kbd "C-M-<down>") (quote movedownc))

(global-set-key (kbd "C-<up>") (quote moveup))
(global-set-key (kbd "C-<down>") (quote movedown))

;; keybiding for ssh console mode!!!
;;(normal-erase-is-backspace-mode 0)
(global-set-key (kbd "M-[ 1 ; 5 A") (quote moveup))
(global-set-key (kbd "M-[ 1 ; 5 B") (quote movedown))
(global-set-key (kbd "M-[ 1 ; 5 C") (quote forward-word))
(global-set-key (kbd "M-[ 1 ; 5 D") (quote backward-word))
(global-set-key (kbd "M-[ 1 ; 5 H") (quote beginning-of-buffer))
(global-set-key (kbd "M-[ 1 ; 5 F") (quote end-of-buffer))
(global-set-key (kbd "M-[ H") (quote move-beginning-of-line))
(global-set-key (kbd "M-[ F") (quote move-end-of-line))
(global-set-key (kbd "M-o h") (quote move-beginning-of-line))
(global-set-key (kbd "M-o f") (quote move-end-of-line))
(global-set-key (kbd "M-o f") (quote move-end-of-line))
(global-set-key (kbd "<select>") (quote move-end-of-line))
(global-set-key (kbd "ESC <deletechar>") (quote kill-word))
(global-set-key (kbd "ESC C-%") (quote query-replace-regexp))

;; Some useful key associations
(global-set-key [f4] (quote toggle-language))
(global-set-key [f5] (quote ispell-buffer))
(global-set-key [f6] (quote ispell-continue))

(global-set-key [f9] (quote dabbrev-expand))

(global-set-key [f10] (quote whitespace-cleanup))
(global-set-key [C-f10] (quote menu-bar-open))
(global-set-key [f11] (quote comment-or-uncomment-region))
(global-set-key [f12] (quote comment-or-uncomment-region))

;; Problems with copy/paste/yank from/to other applications
;; From: http://www.emacswiki.org/emacs/CopyAndPaste
(setq select-active-regions t) ;  active region sets primary X11 selection
(global-set-key [mouse-2] 'mouse-yank-primary)  ; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.

(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

;;(global-set-key [(shift delete)] 'clipboard-kill-region)
;;(global-set-key [(control insert)] 'clipboard-kill-ring-save)
;;(global-set-key [(shift insert)] 'clipboard-yank)

;; Set user email address
(setq user-mail-address "gm@presans.com")

;;(custom-set-variables
;; '(inhibit-startup-screen t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-insert-mode t)
 '(column-number-mode t)
 '(ediff-merge-split-window-function (quote split-window-vertically))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(inhibit-startup-screen t)
 '(insert-shebang-custom-headers (quote (("" . "set -eu"))))
 '(nxml-slash-auto-complete-flag nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Droid Sans Mono" :foundry "unknown" :slant normal :weight normal :height 90 :width normal))))
 '(font-lock-comment-face ((t (:foreground "rosy brown" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "magenta"))))
 '(font-lock-keyword-face ((t (:foreground "firebrick1"))))
 '(font-lock-string-face ((t (:foreground "DeepSkyBlue"))))
 '(font-lock-type-face ((t (:foreground "DarkOrange"))))
 '(font-lock-variable-name-face ((t (:foreground "dark green"))))
 '(highlight ((t (:background "light gray" :weight semi-bold))))
 '(minibuffer-prompt ((t (:inverse-video t))))
 '(mode-line ((t (:background "lightgrey" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(mode-line-highlight ((t (:box (:line-width 2 :color "grey90" :style released-button)))))
 '(org-done ((t (:foreground "tomato" :weight bold))))
 '(show-paren-match ((t (:background "yellow"))))
 '(whitespace-newline ((t (:background "grey70"))))
 '(whitespace-space ((t nil))))

;; use spaces instead of tabs (tab=4 spaces)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
;; show whitespace chars
(require 'whitespace)
(setq-default whitespace-style '(face tabs spaces newline empty trailing indentation::space)) ;add "lines" to visualize lines that are too long
(global-whitespace-mode 1)

;; puts the scrollbars on the right
(set-scroll-bar-mode 'right)


;; ===== From: http://homepages.inf.ed.ac.uk/s0243221/emacs/
; HighLight current line
(global-hl-line-mode 1)
;; Show line-number in the mode line
(line-number-mode 1)
;; Show column-number in the mode line
(column-number-mode 1)

;; === Change backup behaviour
(setq make-backup-files nil)
;; Enable backup files.
(setq make-backup-files t)
;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)
;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
;; From: https://www.gnu.org/software/emacs/manual/html_node/emacs/Backup-Deletion.html
; deletes excess backup files silently
(setq delete-old-versions t)
; number of oldest-backups to keep
(setq kept-old-versions 2)
; number of newest-backups to keep
(setq kept-new-versions 8)

;; For heritrix crawlers
(add-to-list 'auto-mode-alist '("\\.cxml$" . nxml-mode))

;; For PSQL files
(add-to-list 'auto-mode-alist '("\\.psql$" . sql-mode))

;; For Groovy/Grails/gsp
(add-to-list 'load-path "~/.emacs.d/groovy-mode/")
;; For gsp
(add-to-list 'auto-mode-alist '("\\.gsp$" . nxml-mode))
;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
;; overwrite default c indentation with 2 spaces to the same amount as "tab-width"
(setq-default c-basic-offset tab-width) ;; TODO: already in hook below
;; remove automatic insertion of closing brackets
;(groovy-electric-mode nil) ;; TODO: already set in hook below
;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          (lambda ()
            (require 'groovy-electric)
;            (groovy-electric-mode nil) ; TODO: does not work
            (setq-default c-basic-offset tab-width)) ; TODO: does not work
)

;; Show only the last opened file, not the list of opened files
(setq inhibit-startup-buffer-menu t)

; For R
(add-to-list 'load-path "~/.emacs.d/elpa/ess-20160305.530/lisp/")
(load "ess-site")

; For Java
;; To manage the files in a project
(add-to-list 'load-path "~/.emacs.d/SrSpeedbar/")
(require 'sr-speedbar)
(add-to-list 'load-path "~/.emacs.d/elpa/jdee-20151217.1405/")
(require 'jdee)
;; DOES NOT WORK: control keys are not loaded :{
;;(add-to-list 'load-path "~/.emacs.d/jdee-2.4.1/lisp/")
;;(load "jde")

(jdee-set-variables
 '(jdee-bug-debugger-host-address "127.0.0.1")
 '(jdee-debugger (quote ("jdb")))
 '(jdee-gen-println (quote ("'> \"System.out.println(\" ~ \");\"")))
 '(jdee-server-dir "~/.emacs.d/elpa/jdee-20151217.1405/jars/")
 '(jdee-sourcepath
   (quote
    ("~/Work/Code/presans-commons/src/" "~/Work/Code/presans-crawling/src/" "~/Work/Code/presans-indexing/src/" "~/Work/Code/presans-jsofia/src/" "~/Work/Code/presans-machinelearning/src/" "~/Work/Code/presans-searching/src/" "~/Work/Code/sofia2/src/java/" "~/Work/Code/sofia2/src/groovy/" "~/Work/Code/sofia2/grails-app/controllers/" "~/Work/Code/sofia2/grails-app/domain/" "~/Work/Code/sofia2/grails-app/services/")))
 '(jdee-global-classpath
   (quote
    ("/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/rt.jar" "~/Work/Code/presans-commons/presans-commons-1.0.jar" "~/Work/Code/presans-crawling/presans-crawling-1.0.jar" "~/Work/Code/presans-indexing/presans-indexing-1.0.jar" "~/Work/Code/presans-jsofia/presans-jsofia-1.0.jar" "~/Work/Code/presans-machinelearning/presans-machinelearning-1.0.jar" "~/Work/Code/presans-searching/presans-searching-1.0.jar" "~/Work/Code/presans-lib/jars/JRI.jar" "~/Work/Code/presans-lib/jars/JRIEngine.jar" "~/Work/Code/presans-lib/jars/REngine.jar" "~/Work/Code/presans-lib/jars/spring-expression-3.0.5.RELEASE.jar" "~/Work/Code/presans-lib/jars/xml-writer-0.2.jar" "~/Work/Code/presans-lib/jars/heritrix-commons-3.2.0.jar" "~/Work/Code/presans-lib/jars/nekohtmlSamples.jar" "~/Work/Code/presans-lib/jars/wikixmlj-modded.jar" "~/Work/Code/presans-lib/jars/secondstring.jar" "~/Work/Code/presans-lib/jars/proxytoys-1.0.jar" "~/Work/Code/presans-lib/jars/mg4j-1.1.1.jar" "~/Work/Code/presans-lib/jars/guava-r08.jar" "~/Work/Code/presans-lib/jars/jakarta-oro-2.0.8.jar" "~/Work/Code/presans-lib/jars/juniversalchardet-1.0.3.jar" "~/Work/Code/presans-lib/jars/libstemmer.jar" "~/Work/Code/presans-lib/jars/icu4j-53_1.jar" "~/Work/Code/presans-lib/jars/libidn-0.6.5.jar" "~/Work/Code/presans-lib/jars/htmllexer.jar" "~/Work/Code/presans-lib/jars/lucene-highlighter-4.0-SNAPSHOT.jar" "~/Work/Code/presans-lib/jars/commons-collections-3.2.jar" "~/Work/Code/presans-lib/jars/org.arabidopsis.ahocorasick-1.1.jar" "~/Work/Code/presans-lib/jars/jnisvmlight.jar" "~/Work/Code/presans-lib/jars/commons-logging-1.0.4.jar" "~/Work/Code/presans-lib/jars/commons-pool-1.3.jar" "~/Work/Code/presans-lib/jars/kryo-1.01.jar" "~/Work/Code/presans-lib/jars/fastutil-6.4.6.jar" "~/Work/Code/presans-lib/jars/terrier-3.0-core.jar" "~/Work/Code/presans-lib/jars/xom-1.1.jar" "~/Work/Code/presans-lib/jars/heritrix-engine-3.2.0.jar" "~/Work/Code/presans-lib/jars/servlet-api.jar" "~/Work/Code/presans-lib/jars/ezmorph-1.0.6.jar" "~/Work/Code/presans-lib/jars/stanford-ner-2011-06-19.jar" "~/Work/Code/presans-lib/jars/tika-parsers-0.7.jar" "~/Work/Code/presans-lib/jars/postgresql-8.4-701.jdbc4.jar" "~/Work/Code/presans-lib/jars/jbibtex-1.0.14.jar" "~/Work/Code/presans-lib/jars/spring-asm-3.0.5.RELEASE.jar" "~/Work/Code/presans-lib/jars/dsiutils-2.0.7.jar" "~/Work/Code/presans-lib/jars/opencsv-2.3.jar" "~/Work/Code/presans-lib/jars/wstx-asl-3.2.7.jar" "~/Work/Code/presans-lib/jars/spring-beans-3.0.5.RELEASE.jar" "~/Work/Code/presans-lib/jars/commons-cli-1.0.jar" "~/Work/Code/presans-lib/jars/log4j-1.2.15.jar" "~/Work/Code/presans-lib/jars/cls.jar" "~/Work/Code/presans-lib/jars/mongo-2.10.1.jar" "~/Work/Code/presans-lib/jars/jargs.jar" "~/Work/Code/presans-lib/jars/antlr.jar" "~/Work/Code/presans-lib/jars/jwf.jar" "~/Work/Code/presans-lib/jars/jdom-1.1.jar" "~/Work/Code/presans-lib/jars/je-4.1.6.jar" "~/Work/Code/presans-lib/jars/junidecode-0.1.1.jar" "~/Work/Code/presans-lib/jars/commons-io-2.4.jar" "~/Work/Code/presans-lib/jars/junit-4.8.1.jar" "~/Work/Code/presans-lib/jars/commons-beanutils-1.8.3.jar" "~/Work/Code/presans-lib/jars/commons-net-1.4.1.jar" "~/Work/Code/presans-lib/jars/liblinear-1.9-SNAPSHOT.jar" "~/Work/Code/presans-lib/jars/jtidy-r938.jar" "~/Work/Code/presans-lib/jars/tika-core-0.7.jar" "~/Work/Code/presans-lib/jars/xstream-1.3.1.jar" "~/Work/Code/presans-lib/jars/commons-beanutils-core-1.8.3.jar" "~/Work/Code/presans-lib/jars/commons-lang-2.3.jar" "~/Work/Code/presans-lib/jars/fast-md5.jar" "~/Work/Code/presans-lib/jars/spring-aop-3.0.5.RELEASE.jar" "~/Work/Code/presans-lib/jars/htmlparser.jar" "~/Work/Code/presans-lib/jars/sux4j-3.0.4.jar" "~/Work/Code/presans-lib/jars/joda-time-1.6.jar" "~/Work/Code/presans-lib/jars/xpp3_min-1.1.4c.jar" "~/Work/Code/presans-lib/jars/cglib-2.2.jar" "~/Work/Code/presans-lib/jars/commons-validator-1.3.1.jar" "~/Work/Code/presans-lib/jars/weka.jar" "~/Work/Code/presans-lib/jars/archive-overlay-commons-httpclient-3.1.jar" "~/Work/Code/presans-lib/jars/commons-codec-1.9.jar" "~/Work/Code/presans-lib/jars/xstream-benchmark-1.3.1.jar" "~/Work/Code/presans-lib/jars/tika-app-0.7.jar" "~/Work/Code/presans-lib/jars/models.jar" "~/Work/Code/presans-lib/jars/stax-1.2.0.jar" "~/Work/Code/presans-lib/jars/mysql-connector-java-5.1.13-bin.jar" "~/Work/Code/presans-lib/jars/colt-1.2.0.jar" "~/Work/Code/presans-lib/jars/geoip-1.2.6.jar" "~/Work/Code/presans-lib/jars/ia-web-commons-1.0-20131207.033010-102.jar" "~/Work/Code/presans-lib/jars/jena-2.6.4.jar" "~/Work/Code/presans-lib/jars/arq-2.8.7.jar" "~/Work/Code/presans-lib/jars/cpdetector_1.0.7.jar" "~/Work/Code/presans-lib/jars/libsvm.jar" "~/Work/Code/presans-lib/jars/json-20090211.jar" "~/Work/Code/presans-lib/jars/jsap-2.0.jar" "~/Work/Code/presans-lib/jars/dom4j-1.6.1.jar" "~/Work/Code/presans-lib/jars/wayback-core-1.6.0.jar" "~/Work/Code/presans-lib/jars/spring-core-3.0.5.RELEASE.jar" "~/Work/Code/presans-lib/jars/lucene-core-4.0-SNAPSHOT.jar" "~/Work/Code/presans-lib/jars/lucene-memory-4.0-SNAPSHOT.jar" "~/Work/Code/presans-lib/jars/lucene-queryparser-4.0-SNAPSHOT.jar" "~/Work/Code/presans-lib/jars/commons-beanutils-bean-collections-1.8.3.jar" "~/Work/Code/presans-lib/jars/heritrix-modules-3.2.0.jar" "~/Work/Code/presans-lib/jars/je-4.0.71.jar" "~/Work/Code/presans-lib/jars/jsonic-1.2.0.jar" "~/Work/Code/presans-lib/jars/chardet.jar" "~/Work/Code/presans-lib/jars/bzip2.jar" "~/Work/Code/presans-lib/jars/nekohtml.jar" "~/Work/Code/presans-lib/jars/stax-api-1.0.1.jar" "~/Work/Code/presans-lib/jars/spring-context-3.0.5.RELEASE.jar" "~/Work/Code/presans-lib/jars/protobuf-java-2.5.0.jar" "~/Work/Code/presans-lib/jars/cglib-nodep-2.2.jar" "~/Work/Code/presans-lib/jars/bcprov-ext-jdk16-145.jar" "~/Work/Code/presans-lib/jars/jericho-html-2.6.1.jar" "~/Work/Code/presans-lib/jars/json-lib-2.4-jdk15.jar" "~/Work/Code/presans-lib/jars/lucene-analyzers-common-4.0-SNAPSHOT.jar" "~/Work/Code/presans-lib/jars/jettison-1.0.1.jar" "~/Work/Code/presans-lib/jars/xercesImpl.jar" "~/Work/Code/presans-lib/jars/grobid-deps/doublon/commons-io-2.0.1.jar" "~/Work/Code/presans-lib/jars/grobid-deps/naming-core-0.8.jar" "~/Work/Code/presans-lib/jars/grobid-deps/commons-lang3-3.0.1.jar" "~/Work/Code/presans-lib/jars/grobid-deps/commons-pool-1.6.jar" "~/Work/Code/presans-lib/jars/grobid-deps/commons-logging-1.1.1.jar" "~/Work/Code/presans-lib/jars/grobid-deps/commons-io-2.0.1.jar" "~/Work/Code/presans-lib/jars/grobid-deps/slf4j-api-1.6.6.jar" "~/Work/Code/presans-lib/jars/grobid-deps/log4j-1.2.17.jar" "~/Work/Code/presans-lib/jars/grobid-deps/slf4j-log4j12-1.6.6.jar" "~/Work/Code/presans-lib/jars/grobid-deps/naming-java-0.8.jar" "~/Work/Code/presans-lib/jars/grobid-deps/lingpipe-3.8.2.jar" "~/Work/Code/presans-lib/jars/grobid-deps/crfpp-1.0.2.jar" "~/Work/Code/presans-lib/jars/grobid-libs/grobid-core-0.2.8.jar" "~/Work/Code/presans-lib/jars/grobid-libs/grobid-trainer-0.0.16.jar" "~/Work/Code/presans-lib/jars/grobid-libs/grobid-home-0.2.13.jar" "" "." "~/Work/Code/heritrix-3.2.0/lib/spring-expression-3.0.5.RELEASE.jar" "~/Work/Code/heritrix-3.2.0/lib/heritrix-commons-3.2.0.jar" "~/Work/Code/heritrix-3.2.0/lib/groovy-all-1.6.3.jar" "~/Work/Code/heritrix-3.2.0/lib/bsh-2.0b5.jar" "~/Work/Code/heritrix-3.2.0/lib/guava-r08.jar" "~/Work/Code/heritrix-3.2.0/lib/jna-3.2.3.jar" "~/Work/Code/heritrix-3.2.0/lib/commons-logging-1.0.4.jar" "~/Work/Code/heritrix-3.2.0/lib/kryo-1.01.jar" "~/Work/Code/heritrix-3.2.0/lib/poi-scratchpad-2.5.1-final-20040804.jar" "~/Work/Code/heritrix-3.2.0/lib/heritrix-engine-3.2.0.jar" "~/Work/Code/heritrix-3.2.0/lib/jline-0.9.94.jar" "~/Work/Code/heritrix-3.2.0/lib/commons-cli-1.1.jar" "~/Work/Code/heritrix-3.2.0/lib/ant-1.7.1.jar" "~/Work/Code/heritrix-3.2.0/lib/spring-asm-3.0.5.RELEASE.jar" "~/Work/Code/heritrix-3.2.0/lib/fastutil-5.0.7.jar" "~/Work/Code/heritrix-3.2.0/lib/spring-beans-3.0.5.RELEASE.jar" "~/Work/Code/heritrix-3.2.0/lib/jets3t-0.5.0.jar" "~/Work/Code/heritrix-3.2.0/lib/httpcore-4.3.jar" "~/Work/Code/heritrix-3.2.0/lib/je-4.1.6.jar" "~/Work/Code/heritrix-3.2.0/lib/org.restlet-1.1.10.jar" "~/Work/Code/heritrix-3.2.0/lib/aopalliance-1.0.jar" "~/Work/Code/heritrix-3.2.0/lib/htmlparser-1.6.jar" "~/Work/Code/heritrix-3.2.0/lib/spring-aop-3.0.5.RELEASE.jar" "~/Work/Code/heritrix-3.2.0/lib/joda-time-1.6.jar" "~/Work/Code/heritrix-3.2.0/lib/com.noelios.restlet.ext.jetty-1.1.10.jar" "~/Work/Code/heritrix-3.2.0/lib/archive-overlay-commons-httpclient-3.1.jar" "~/Work/Code/heritrix-3.2.0/lib/commons-net-2.0.jar" "~/Work/Code/heritrix-3.2.0/lib/jetty-6.1.26.jar" "~/Work/Code/heritrix-3.2.0/lib/itext-1.3.jar" "~/Work/Code/heritrix-3.2.0/lib/ia-web-commons-1.0-20131207.033010-102.jar" "~/Work/Code/heritrix-3.2.0/lib/mg4j-1.0.1.jar" "~/Work/Code/heritrix-3.2.0/lib/json-20090211.jar" "~/Work/Code/heritrix-3.2.0/lib/junit-3.8.2.jar" "~/Work/Code/heritrix-3.2.0/lib/libidn-1.15.jar" "~/Work/Code/heritrix-3.2.0/lib/reflectasm-0.8.jar" "~/Work/Code/heritrix-3.2.0/lib/ant-launcher-1.7.1.jar" "~/Work/Code/heritrix-3.2.0/lib/commons-lang-2.6.jar" "~/Work/Code/heritrix-3.2.0/lib/spring-core-3.0.5.RELEASE.jar" "~/Work/Code/heritrix-3.2.0/lib/javaswf-CVS-SNAPSHOT-1.jar" "~/Work/Code/heritrix-3.2.0/lib/com.noelios.restlet-1.1.10.jar" "~/Work/Code/heritrix-3.2.0/lib/heritrix-modules-3.2.0.jar" "~/Work/Code/heritrix-3.2.0/lib/commons-io-1.4.jar" "~/Work/Code/heritrix-3.2.0/lib/servlet-api-2.5-20081211.jar" "~/Work/Code/heritrix-3.2.0/lib/freemarker-2.3.19.jar" "~/Work/Code/heritrix-3.2.0/lib/poi-2.5.1-final-20040804.jar" "~/Work/Code/heritrix-3.2.0/lib/jetty-ajp-6.1.11.jar" "~/Work/Code/heritrix-3.2.0/lib/spring-context-3.0.5.RELEASE.jar" "~/Work/Code/heritrix-3.2.0/lib/commons-collections-3.1.jar" "~/Work/Code/heritrix-3.2.0/lib/jericho-html-2.6.1.jar" "~/Work/Code/heritrix-3.2.0/lib/jetty-sslengine-6.1.26.jar" "~/Work/Code/heritrix-3.2.0/lib/jetty-util-6.1.26.jar" "~/Work/Code/heritrix-3.2.0/lib/dnsjava-2.0.3.jar" "~/Work/Code/heritrix-3.2.0/lib/commons-codec-1.6.jar" "~/Work/Code/heritrix-3.2.0/lib/minlog-1.2.jar")))
 '(jdee-jdk (quote ("1.8.0")))
 '(jdee-jdk-doc-url "/usr/share/doc/openjdk-8-doc/api/index.html")
 '(jdee-jdk-registry (quote (("1.7.0" . "/usr/lib/jvm/java-8-openjdk-amd64/"))))
 '(jdee-make-working-directory "~/Work/Code/dist")
 '(jdee-run-working-directory "~/Work/Code/dist")
 '(jdee-server-dir "~/.emacs.d/elpa/jdee-20151217.1405/jars/")
 '(jdee-sourcepath
   (quote
    ("~/Work/Code/presans-commons/src/" "~/Work/Code/presans-crawling/src/" "~/Work/Code/presans-indexing/src/" "~/Work/Code/presans-jsofia/src/" "~/Work/Code/presans-machinelearning/src/" "~/Work/Code/presans-searching/src/" "~/Work/Code/sofia2/src/java/" "~/Work/Code/sofia2/src/groovy/" "~/Work/Code/sofia2/grails-app/controllers/" "~/Work/Code/sofia2/grails-app/domain/" "~/Work/Code/sofia2/grails-app/services/")))
)

;; (autoload 'jdee-mode "jdee" "JDEE mode" t)
;;(setq auto-mode-alist (append '(("\\.java\\'" . jdee-mode)) auto-mode-alist))
(put 'downcase-region 'disabled nil)
(setq browse-url-browser-function (quote browse-url-firefox))
;;(setq browse-url-browser-function (quote eww-browse-url))
;(global-set-key (kbd "C-c C-v C-s") (quote sr-speedbar-toggle))
;(global-set-key (kbd "C-c C-v C-i") (quote jdee-import-find-and-import))
;(global-set-key (kbd "C-c C-v C-l") (quote jdee-gen-println))
;(global-set-key (kbd "C-c C-v C-g") (quote jdee-wiz-get-set-methods))
;(global-set-key (kbd "C-c C-v C-n") (quote jdee-help-browse-jdk-doc))
;(global-set-key (kbd "C-c C-v C-w") (quote jdee-help-symbol))
;(global-set-key (kbd "C-c C-v TAB") (quote jdee-complete))
(setq jdee-key-bindings (quote
    (("[(control c) (control v) (control a)]" . jdee-run-menu-run-applet)
     ("[(control c) (control v) (control b)]" . jdee-build)
     ("[(control c) (control v) (control c)]" . jdee-compile)
     ("[(control c) (control v) (control d)]" . jdee-debug)
     ("[(control c) (control v) (control f)]" . jdee-find)
     ("[(control c) (control v) (control g)]" . jdee-open-class-at-point)
     ("[(control c) (control v) (control k)]" . jdee-bsh-run)
     ("[(control c) (control v) (control n)]" . jdee-help-browse-jdk-doc)
     ("[(control c) (control v) (control p)]" . jdee-save-project)
     ("[(control c) (control v) (control q)]" . jdee-wiz-update-class-list)
     ("[(control c) (control v) (control r)]" . jdee-run)
     ("[(control c) (control v) (control s)]" . sr-speedbar-toggle) ; speedbar-frame-mode
     ("[(control c) (control v) (control t)]" . jdee-jdb-menu-debug-applet)
     ("[(control c) (control v) (control w)]" . jdee-help-symbol)
     ("[(control c) (control v) (control x)]" . jdee-show-superclass-source)
     ("[(control c) (control v) (control y)]" . jdee-open-class-at-point)
     ("[(control c) (control v) ?a]" . jdee-wiz-implement-interface)
     ("[(control c) (control v) ?c]" . jdee-gen-class)
     ("[(control c) (control v) ?e]" . jdee-wiz-extend-abstract-class)
     ("[(control c) (control v) ?f]" . jdee-gen-try-finally-wrapper)
     ("[(control c) (control v) ?i]" . jdee-import-find-and-import)
     ("[(control c) (control v) ?j]" . jdee-javadoc-autodoc-at-line)
     ("[(control c) (control v) ?l]" . jdee-gen-println)
     ("[(control c) (control v) ?m]" . jdee-gen-main-method)
     ("[(control c) (control v) ?o]" . jdee-wiz-override-method)
     ("[(control c) (control v) ?s]" . sr-speedbar-toggle)
     ("[(control c) (control v) ?t]" . jdee-gen-tostring-method)
     ("[(control c) (control v) ?u]" . jdee-gen-try-catch-wrapper)
     ("[(control c) (control v) ?z]" . jdee-import-all)
     ("[(control c) (control v) ?]" . jdee-run-etrace-prev)
     ("[(control c) (control v) ?]" . jdee-run-etrace-next)
;     ("[(control c) (control v) (control ?.)]" . jdee-complete)
;     ("[(control c) (control v) ?.]" . jdee-complete-in-line)
     ("[(control c) (control v) (control ?.)]" . jdee-complete-in-line)
     ("[(control c) (control v) ?\t]" . jdee-complete)
     )))


(require 'ox-latex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
;; Uses sections only for top-level entries, & itemize for everythin else!
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))
;(add-to-list 'org-latex-classes
;             '("book"
;               "\\documentclass{book}"
;               ("\\part{%s}" . "\\part*{%s}")
;               ("\\chapter{%s}" . "\\chapter*{%s}")
;               ("\\section{%s}" . "\\section*{%s}")
;               ("\\subsection{%s}" . "\\subsection*{%s}")
;               ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
;             )
