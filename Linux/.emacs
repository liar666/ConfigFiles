;; Set default encoding
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
;; Make dired list files like ls -ahl would do
(setq dired-listing-switches "-ahl")
;; Make dabbrev be case sensitive
;(setq dabbrev-case-fold-search "case-fold-search")
;(setq dabbrev-case-replace nil)
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


;; M-Del delete word, does not go to next parenthesis!
(global-unset-key "\C-\M-d")
(global-set-key "\C-d" 'delete-char)
(global-set-key "\C-\M-d" 'kill-word)
(global-set-key (kbd "<escape> <deletechar>") 'kill-word)
(global-set-key (kbd "<escape> DEL") 'backward-kill-word)
(global-set-key [(control tab)] 'other-window)

(global-set-key (kbd "C-M-<up>") (quote moveupc))
(global-set-key (kbd "C-M-<down>") (quote movedownc))

(global-set-key (kbd "C-<up>") (quote moveup))
(global-set-key (kbd "C-<down>") (quote movedown))

;; Requires configuration of .Xdefaults/.Xresources
;;*vt100.modifyOtherKeys: 1
;;*vt100.formatOtherKeys: 1
(global-set-key (kbd "[37;6u") 'query-replace-regexp)

;;·keybiding·for·ssh·console·mode!!!$
(global-set-key (kbd "M-[ 1 ; 5 A") (quote moveup))
(global-set-key (kbd "M-[ 1 ; 5 B") (quote movedown))
(global-set-key (kbd "M-[ 1 ; 5 C") (quote forward-word))
(global-set-key (kbd "M-[ 1 ; 5 D") (quote backward-word))

;; Emacs 24 now differenciates ESC- and M-!!!
(global-set-key (kbd "<escape> u") 'upcase-word)
(global-set-key (kbd "<escape> l") 'downcase-word)
(global-set-key (kbd "<escape> c") 'capitalize-word)
(global-set-key (kbd "<escape> t") 'transpose-words)
(global-set-key (kbd "<escape> q") 'fill-paragraph)
(global-set-key (kbd "<escape> %") 'query-replace)
(global-set-key (kbd "<escape> #") 'query-replace-regexp)
(global-set-key (kbd "M-#") 'query-replace-regexp)
(global-set-key (kbd "<escape> C-%") 'query-replace-regexp)
(global-set-key (kbd "<escape> x") 'execute-extended-command)
(global-set-key (kbd "<escape> $") 'ispell-word)
(global-set-key (kbd "<escape> g g") 'goto-line)
(global-set-key (kbd "<escape> <deletechar>") (quote kill-word))

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

;;(custom-set-variables
;; '(inhibit-startup-screen t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-merge-split-window-function (quote split-window-vertically))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(inhibit-startup-screen t)
 '(jdee-gen-println
   (quote
    ("(beginning-of-line)" "'> \"System.out.println(\" ~ \");\"")))
 '(jdee-global-classpath
   (quote
    ("/usr/share/java/bsh.jar" "/home/guillaume/Work/Code/presans-commons/presans-commons-1.0.jar" "/home/guillaume/Work/Code/presans-crawling/presans-crawling-1.0.jar" "/home/guillaume/Work/Code/presans-indexing/presans-indexing-1.0.jar" "/home/guillaume/Work/Code/presans-jsofia/presans-jsofia-1.0.jar" "/home/guillaume/Work/Code/presans-machinelearning/presans-machinelearning-1.0.jar" "/home/guillaume/Work/Code/presans-searching/presans-searching-1.0.jar" "" "/home/guillaume/Work/Code/presans-lib/jars/spring-expression-3.0.5.RELEASE.jar" "/home/guillaume/Work/Code/presans-lib/jars/xml-writer-0.2.jar" "/home/guillaume/Work/Code/presans-lib/jars/heritrix-commons-3.2.0.jar" "/home/guillaume/Work/Code/presans-lib/jars/nekohtmlSamples.jar" "/home/guillaume/Work/Code/presans-lib/jars/wikixmlj-modded.jar" "/home/guillaume/Work/Code/presans-lib/jars/secondstring.jar" "/home/guillaume/Work/Code/presans-lib/jars/proxytoys-1.0.jar" "/home/guillaume/Work/Code/presans-lib/jars/mg4j-1.1.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/guava-r08.jar" "/home/guillaume/Work/Code/presans-lib/jars/jakarta-oro-2.0.8.jar" "/home/guillaume/Work/Code/presans-lib/jars/juniversalchardet-1.0.3.jar" "/home/guillaume/Work/Code/presans-lib/jars/libstemmer.jar" "/home/guillaume/Work/Code/presans-lib/jars/icu4j-53_1.jar" "/home/guillaume/Work/Code/presans-lib/jars/libidn-0.6.5.jar" "/home/guillaume/Work/Code/presans-lib/jars/htmllexer.jar" "/home/guillaume/Work/Code/presans-lib/jars/lucene-highlighter-4.0-SNAPSHOT.jar" "/home/guillaume/Work/Code/presans-lib/jars/commons-collections-3.2.jar" "/home/guillaume/Work/Code/presans-lib/jars/org.arabidopsis.ahocorasick-1.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/jnisvmlight.jar" "/home/guillaume/Work/Code/presans-lib/jars/commons-logging-1.0.4.jar" "/home/guillaume/Work/Code/presans-lib/jars/commons-pool-1.3.jar" "/home/guillaume/Work/Code/presans-lib/jars/kryo-1.01.jar" "/home/guillaume/Work/Code/presans-lib/jars/fastutil-6.4.6.jar" "/home/guillaume/Work/Code/presans-lib/jars/terrier-3.0-core.jar" "/home/guillaume/Work/Code/presans-lib/jars/xom-1.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/heritrix-engine-3.2.0.jar" "/home/guillaume/Work/Code/presans-lib/jars/servlet-api.jar" "/home/guillaume/Work/Code/presans-lib/jars/ezmorph-1.0.6.jar" "/home/guillaume/Work/Code/presans-lib/jars/stanford-ner-2011-06-19.jar" "/home/guillaume/Work/Code/presans-lib/jars/tika-parsers-0.7.jar" "/home/guillaume/Work/Code/presans-lib/jars/postgresql-8.4-701.jdbc4.jar" "/home/guillaume/Work/Code/presans-lib/jars/jbibtex-1.0.14.jar" "/home/guillaume/Work/Code/presans-lib/jars/spring-asm-3.0.5.RELEASE.jar" "/home/guillaume/Work/Code/presans-lib/jars/dsiutils-2.0.7.jar" "/home/guillaume/Work/Code/presans-lib/jars/opencsv-3.5.jar" "/home/guillaume/Work/Code/presans-lib/jars/wstx-asl-3.2.7.jar" "/home/guillaume/Work/Code/presans-lib/jars/spring-beans-3.0.5.RELEASE.jar" "/home/guillaume/Work/Code/presans-lib/jars/commons-cli-1.0.jar" "/home/guillaume/Work/Code/presans-lib/jars/log4j-1.2.15.jar" "/home/guillaume/Work/Code/presans-lib/jars/cls.jar" "/home/guillaume/Work/Code/presans-lib/jars/mongo-2.10.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/jargs.jar" "/home/guillaume/Work/Code/presans-lib/jars/antlr.jar" "/home/guillaume/Work/Code/presans-lib/jars/jwf.jar" "/home/guillaume/Work/Code/presans-lib/jars/jdom-1.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/je-4.1.6.jar" "/home/guillaume/Work/Code/presans-lib/jars/junidecode-0.1.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/commons-io-2.4.jar" "/home/guillaume/Work/Code/presans-lib/jars/junit-4.8.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/commons-beanutils-1.8.3.jar" "/home/guillaume/Work/Code/presans-lib/jars/commons-net-1.4.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/liblinear-1.9-SNAPSHOT.jar" "/home/guillaume/Work/Code/presans-lib/jars/jtidy-r938.jar" "/home/guillaume/Work/Code/presans-lib/jars/tika-core-0.7.jar" "/home/guillaume/Work/Code/presans-lib/jars/xstream-1.3.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/commons-beanutils-core-1.8.3.jar" "/home/guillaume/Work/Code/presans-lib/jars/commons-lang-2.3.jar" "/home/guillaume/Work/Code/presans-lib/jars/fast-md5.jar" "/home/guillaume/Work/Code/presans-lib/jars/spring-aop-3.0.5.RELEASE.jar" "/home/guillaume/Work/Code/presans-lib/jars/htmlparser.jar" "/home/guillaume/Work/Code/presans-lib/jars/sux4j-3.0.4.jar" "/home/guillaume/Work/Code/presans-lib/jars/joda-time-1.6.jar" "/home/guillaume/Work/Code/presans-lib/jars/xpp3_min-1.1.4c.jar" "/home/guillaume/Work/Code/presans-lib/jars/cglib-2.2.jar" "/home/guillaume/Work/Code/presans-lib/jars/commons-validator-1.3.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/weka.jar" "/home/guillaume/Work/Code/presans-lib/jars/archive-overlay-commons-httpclient-3.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/commons-codec-1.9.jar" "/home/guillaume/Work/Code/presans-lib/jars/xstream-benchmark-1.3.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/tika-app-0.7.jar" "/home/guillaume/Work/Code/presans-lib/jars/models.jar" "/home/guillaume/Work/Code/presans-lib/jars/stax-1.2.0.jar" "/home/guillaume/Work/Code/presans-lib/jars/mysql-connector-java-5.1.13-bin.jar" "/home/guillaume/Work/Code/presans-lib/jars/colt-1.2.0.jar" "/home/guillaume/Work/Code/presans-lib/jars/geoip-1.2.6.jar" "/home/guillaume/Work/Code/presans-lib/jars/ia-web-commons-1.0-20131207.033010-102.jar" "/home/guillaume/Work/Code/presans-lib/jars/jena-2.6.4.jar" "/home/guillaume/Work/Code/presans-lib/jars/arq-2.8.7.jar" "/home/guillaume/Work/Code/presans-lib/jars/cpdetector_1.0.7.jar" "/home/guillaume/Work/Code/presans-lib/jars/libsvm.jar" "/home/guillaume/Work/Code/presans-lib/jars/json-20090211.jar" "/home/guillaume/Work/Code/presans-lib/jars/jsap-2.0.jar" "/home/guillaume/Work/Code/presans-lib/jars/dom4j-1.6.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/wayback-core-1.6.0.jar" "/home/guillaume/Work/Code/presans-lib/jars/spring-core-3.0.5.RELEASE.jar" "/home/guillaume/Work/Code/presans-lib/jars/lucene-core-4.0-SNAPSHOT.jar" "/home/guillaume/Work/Code/presans-lib/jars/lucene-memory-4.0-SNAPSHOT.jar" "/home/guillaume/Work/Code/presans-lib/jars/lucene-queryparser-4.0-SNAPSHOT.jar" "/home/guillaume/Work/Code/presans-lib/jars/commons-beanutils-bean-collections-1.8.3.jar" "/home/guillaume/Work/Code/presans-lib/jars/heritrix-modules-3.2.0.jar" "/home/guillaume/Work/Code/presans-lib/jars/je-4.0.71.jar" "/home/guillaume/Work/Code/presans-lib/jars/jsonic-1.3.5.jar" "/home/guillaume/Work/Code/presans-lib/jars/chardet.jar" "/home/guillaume/Work/Code/presans-lib/jars/bzip2.jar" "/home/guillaume/Work/Code/presans-lib/jars/nekohtml.jar" "/home/guillaume/Work/Code/presans-lib/jars/stax-api-1.0.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/spring-context-3.0.5.RELEASE.jar" "/home/guillaume/Work/Code/presans-lib/jars/protobuf-java-2.5.0.jar" "/home/guillaume/Work/Code/presans-lib/jars/cglib-nodep-2.2.jar" "/home/guillaume/Work/Code/presans-lib/jars/bcprov-ext-jdk16-145.jar" "/home/guillaume/Work/Code/presans-lib/jars/jericho-html-2.6.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/json-lib-2.4-jdk15.jar" "/home/guillaume/Work/Code/presans-lib/jars/lucene-analyzers-common-4.0-SNAPSHOT.jar" "/home/guillaume/Work/Code/presans-lib/jars/jettison-1.0.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/xercesImpl.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/doublon/commons-io-2.0.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/imageio-pnm-1.0.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/xml-apis-1.4.01.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/wapiti-1.5.0.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/xercesImpl-2.11.0.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/wipo-analysers-0.0.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/lucene-analyzers-common-4.5.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/lucene-analyzers-kuromoji-4.5.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/lucene-analyzers-smartcn-4.5.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/lucene-core-4.5.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/jsonic-1.3.5.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/language-detection-09-13-2011.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/naming-core-0.8.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/commons-lang3-3.0.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/commons-pool-1.6.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/commons-logging-1.1.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/commons-io-2.0.1.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/slf4j-api-1.7.7.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/log4j-1.2.17.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/slf4j-log4j12-1.7.7.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/naming-java-0.8.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/lingpipe-3.8.2.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-deps/crfpp-1.0.2.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-libs/grobid-core-0.2.8.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-libs/grobid-trainer-0.0.16.jar" "/home/guillaume/Work/Code/presans-lib/jars/grobid-libs/grobid-home-0.2.13.jar" "" "." "/home/guillaume/Work/Code/heritrix-3.2.0/lib/spring-expression-3.0.5.RELEASE.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/heritrix-commons-3.2.0.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/groovy-all-1.6.3.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/bsh-2.0b5.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/guava-r08.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/jna-3.2.3.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/commons-logging-1.0.4.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/kryo-1.01.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/poi-scratchpad-2.5.1-final-20040804.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/heritrix-engine-3.2.0.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/jline-0.9.94.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/commons-cli-1.1.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/ant-1.7.1.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/spring-asm-3.0.5.RELEASE.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/fastutil-5.0.7.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/spring-beans-3.0.5.RELEASE.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/jets3t-0.5.0.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/httpcore-4.3.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/je-4.1.6.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/org.restlet-1.1.10.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/aopalliance-1.0.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/htmlparser-1.6.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/spring-aop-3.0.5.RELEASE.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/joda-time-1.6.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/com.noelios.restlet.ext.jetty-1.1.10.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/archive-overlay-commons-httpclient-3.1.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/commons-net-2.0.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/jetty-6.1.26.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/itext-1.3.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/ia-web-commons-1.0-20131207.033010-102.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/mg4j-1.0.1.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/json-20090211.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/junit-3.8.2.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/libidn-1.15.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/reflectasm-0.8.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/ant-launcher-1.7.1.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/commons-lang-2.6.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/spring-core-3.0.5.RELEASE.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/javaswf-CVS-SNAPSHOT-1.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/com.noelios.restlet-1.1.10.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/heritrix-modules-3.2.0.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/commons-io-1.4.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/servlet-api-2.5-20081211.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/freemarker-2.3.19.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/poi-2.5.1-final-20040804.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/jetty-ajp-6.1.11.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/spring-context-3.0.5.RELEASE.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/commons-collections-3.1.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/jericho-html-2.6.1.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/jetty-sslengine-6.1.26.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/jetty-util-6.1.26.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/dnsjava-2.0.3.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/commons-codec-1.6.jar" "/home/guillaume/Work/Code/heritrix-3.2.0/lib/minlog-1.2.jar")))
 '(jdee-make-working-directory "~/Work/Code/dist")
 '(jdee-run-working-directory "~/Work/Code/dist")
 '(jdee-server-dir "~/.emacs.d/jdee-20160130.1430/jars/")
 '(show-paren-mode t)
 '(vc-follow-symlinks t)
 '(minibuffer-prompt ((t (:inverse-video t))))
 '(mode-line ((t (:background "yellow" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(mode-line-highlight ((t (:box (:line-width 2 :color "grey90" :style released-button)))))
 '(show-paren-match ((t (:background "yellow"))))
 '(whitespace-newline ((t (:background "grey70"))))
 '(whitespace-space ((t (:background "white")))))

(if (display-graphic-p)
; if in Xwindow, set small fonts
 (custom-set-faces
  '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "Ubuntu Mono")))))
; if in -nw mode, set colors & fonts
 (custom-set-faces
  '(font-lock-comment-face ((t (:foreground "brightblack" :slant italic))))
  '(font-lock-constant-face ((t (:foreground "magenta"))))
  '(font-lock-keyword-face ((t (:foreground "brightred"))))
  '(font-lock-string-face ((t (:foreground "brightblue"))))
  '(font-lock-type-face ((t (:foreground "yellow"))))
  '(font-lock-variable-name-face ((t (:foreground "green"))))
  '(highlight ((t (:background "brightcyan" :weight semi-bold))))
  '(minibuffer-prompt ((t (:inverse-video t))))
  '(mode-line ((t (:background "yellow" :foreground "black" :box (:line-width -1 :style released-button)))))
  '(mode-line-highlight ((t (:box (:line-width 2 :color "grey90" :style released-button)))))
  '(show-paren-match ((t (:background "yellow"))))
  '(whitespace-newline ((t (:background "grey70"))))
  '(whitespace-space ((t (:background "white")))))
)

;; use spaces instead of tabs (tab=4 spaces)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
;; show whitespace chars
(require 'whitespace)
(setq-default whitespace-style '(face tabs newline empty trailing indentation::space)) ;add "lines" to visualize lines that are too long
(global-whitespace-mode 1)

;; puts the scrollbars on the right
(set-scroll-bar-mode 'right)


;; Disable auto-indentation in fundamental&org modes
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
;;(setq electric-indent-mode nil)
;; TO TEST:
;; (add-hook 'fundamental/org-mode-hook
;;           (lambda ()
;;             (setq electric-indent-mode nil)
;;           )
;; )


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
;;; (add-to-list 'load-path "~/.emacs.d/") ;; !!!emacs now warns not to do that!!!
(add-to-list 'load-path "~/.emacs.d/groovy-mode/")
(require 'cl)
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
(tool-bar-mode -1)
(put 'downcase-region 'disabled nil)

;(server-start)

;; OrgMode
(setq org-default-notes-file "~/.emacs.d/notes.org")
(global-set-key "\C-cc" 'org-capture)

; For Java
;; Define my correct email address (for java docs)
(setq user-mail-address "gm@presans.com")
(add-to-list 'load-path "~/.emacs.d/jdee-20160130.1430/")
(require 'jdee) ;;(autoload 'jdee-mode "jdee" "JDE mode" t)
(setq auto-mode-alist (append '(("\\.java\\'" . jdee-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\\.bsh\\'" . jdee-mode)) auto-mode-alist))
(setq browse-url-browser-function (quote browse-url-firefox))
(setq jdee-key-bindings (quote
;; C-c C-e => external tool (firefox @docs)
;; C-c C-v => commands (build, etc?)
;; C-c C-g => generate single lines of code (case, catch, if, comments, etc.)
;; C-c C-f => generate full wrappers (switch-case, if-then-else, forloop)
    (("[? ? ?]" . jdee-run-menu-run-applet)
     ("[? ? ?]" . jdee-build)
     ("[? ? ?]" . jdee-compile)
     ("[? ? ?]" . jdee-debug)
     ("[? ? ?]" . jdee-find)
     ("[? ? ?]" . jdee-open-class-at-point)    ; COOL
     ("[? ? ?]" . jdee-bsh-run)                ; COOL
     ("[? ? ?]" . jdee-help-browse-jdk-doc)    ; GM
     ("[? ? ?]" . jdee-save-project)
     ("[? ? ?]" . jdee-wiz-update-class-list)
     ("[? ? ?]" . jdee-run)
     ("[? ? ?]" . speedbar-frame-mode)
     ("[? ? ?]" . jdee-jdb-menu-debug-applet)  ; GM
     ("[? ? ?]" . jdee-help-symbol)            ; GM
     ("[? ? ?]" . jdee-show-superclass-source)
     ("[? ? ?]" . jdee-open-class-at-point)    ; COOL
     ("[? ? ?a]" . jdee-wiz-implement-interface)
     ("[? ? ?c]" . jdee-gen-class)               ; GM
;     ("[? ? ?c]" . jdee-gen-case)               ; GM
     ("[? ? ?d]" . jdee-gen-switch)              ; GM "d" is close to "s"
     ("[? ? ?e]" . jdee-wiz-extend-abstract-class)
     ("[? ? ?f]" . jdee-gen-try-finally-wrapper) ; COOL
     ("[? ? ?g]" . jdee-wiz-get-set-methods)  ; GM
     ("[? ? ?i]" . jdee-import-find-and-import)  ; GM
;     ("[? ? ?i ?o]" . jdee-import-organize)  ; GM
     ("[? ? ?j]" . jdee-javadoc-autodoc-at-line)
     ("[? ? ?l]" . jdee-gen-println)             ; GM
     ("[? ? ?m]" . jdee-gen-main-method)         ; GM
     ("[? ? ?o]" . jdee-wiz-override-method)
     ("[? ? ?s]" . sr-speedbar-toggle)          ; GM
     ("[? ? ?t]" . jdee-gen-tostring-method)     ; GM
     ("[? ? ?u]" . jdee-gen-if-else-wrapper) ; GM
;     ("[? ? ?]" . jdee-gen-ife)  ; GM "u" is close to "i"
     ("[? ? ?y]" . jdee-gen-try-catch-wrapper)   ; COOL "y" is close to "t"
;     ("[? ? ?]" . jdee-gen-try-catch-wrapper)   ; COOL "y" is close to "t"
     ("[? ? ?z]" . jdee-import-all)
     ("[? ? ?]" . jdee-run-etrace-prev)
     ("[? ? ?]" . jdee-run-etrace-next)
;     ("[(control c) (control v) (control ?.)]" . jdee-complete)
;     ("[(control c) (control v) ?.]" . jdee-complete-in-line)
     ("[(control c) (control v) (control ?.)]" . jdee-complete-in-line)  ; GM
     ("[(control c) (control v) ?\t]" . jdee-complete)                   ; GM
     )))
;; >jdee-abbrev-mode               M-x ... RET
;; >jdee-browse-class              M-x ... RET
;; >jdee-browse-class-at-point     M-x ... RET
;; >jdee-bsh-run                   M-x ... RET
;; >jdee-bug-display-path-info     M-x ... RET
;; >jdee-bug-set-breakpoint        M-x ... RET
;; >jdee-bug-step-into             M-x ... RET
;; >jdee-bug-step-into-all         M-x ... RET
;; >jdee-bug-step-over             M-x ... RET
;; >jdee-bug-toggle-breakpoint     M-x ... RET
;; >jdee-build                     M-x ... RET
;; >jdee-checkstyle                M-x ... RET
;; >jdee-compile                   M-x ... RET
;; >jdee-complete                  M-x ... RET
;; >jdee-complete-in-line          M-x ... RET
;; >jdee-complete-menu             M-x ... RET
;; >jdee-create-new-project        M-x ... RET
;; >jdee-customize-variable        M-x ... RET
;; >jdee-db-get-class              M-x ... RET
;; >jdee-db-set-app-args           M-x ... RET
;; >jdee-db-set-args               M-x ... RET
;; >jdee-debug-clear-breakpoint    M-x ... RET
;; >jdee-debug-list-breakpoints    M-x ... RET
;; >jdee-debug-quit                M-x ... RET
;; >jdee-debug-run                 M-x ... RET
;; >jdee-debug-set-breakpoint      M-x ... RET
;; >jdee-debug-step-into           M-x ... RET
;; >jdee-debug-step-over           M-x ... RET
;; >jdee-debug-toggle-breakpoint   M-x ... RET
;; >jdee-describe-path             M-x ... RET
;; >jdee-electric-return           M-x ... RET
;; >jdee-find                      M-x ... RET
;; >jdee-find-class-source         M-x ... RET
;; >jdee-gen-bean                  M-x ... RET
;; >jdee-gen-case                  M-x ... RET
;; >jdee-gen-catch                 M-x ... RET
;; >jdee-gen-class                 M-x ... RET
;; >jdee-gen-eif                   M-x ... RET
;; >jdee-gen-else                  M-x ... RET
;; >jdee-gen-embrace               M-x ... RET
;; >jdee-gen-equals-method         M-x ... RET
;; >jdee-gen-exception             M-x ... RET
;; >jdee-gen-finally               M-x ... RET
;; >jdee-gen-for                   M-x ... RET
;; >jdee-gen-fori                  M-x ... RET
;; >jdee-gen-foriter               M-x ... RET
;; >jdee-gen-get-set               M-x ... RET
;; >jdee-gen-get-set-methods       M-x ... RET
;; >jdee-gen-hashcode-method       M-x ... RET
;; >jdee-gen-if                    M-x ... RET
;; >jdee-gen-if-else-wrapper       M-x ... RET
;; >jdee-gen-ife                   M-x ... RET
;; >jdee-gen-main-method           M-x ... RET
;; >jdee-gen-method                M-x ... RET
;; >jdee-gen-object-methods        M-x ... RET
;; >jdee-gen-property              M-x ... RET
;; >jdee-gen-section-comment       M-x ... RET
;; >jdee-gen-switch                M-x ... RET
;; >jdee-gen-tostring-method       M-x ... RET
;; >jdee-gen-try                   M-x ... RET
;; >jdee-gen-try-catch-wrapper     M-x ... RET
;; >jdee-gen-try-finally-wrapper   M-x ... RET
;; >jdee-gen-while                 M-x ... RET
;; >jdee-help-beanshell            M-x ... RET
;; >jdee-help-browse-jdk-doc       M-x ... RET
;; >jdee-help-class                M-x ... RET
;; >jdee-help-symbol               M-x ... RET
;; >jdee-import-all                M-x ... RET
;; >jdee-import-all-unique         M-x ... RET
;; >jdee-import-at-point           M-x ... RET
;; >jdee-import-find-and-import    M-x ... RET
;; >jdee-import-kill-extra-imports M-x ... RET
;; >jdee-import-organize           M-x ... RET
;; >jdee-import-sort               M-x ... RET
;; >jdee-javadoc-customize         M-x ... RET
;; >jdee-junit-test-class          M-x ... RET
;; >jdee-keys                      M-x ... RET
;; >jdee-load-all-project-files    M-x ... RET
;; >jdee-load-project-file         M-x ... RET
;; >jdee-make                      M-x ... RET
;; >jdee-open-class-at-point       M-x ... RET
;; >jdee-open-class-source         M-x ... RET
;; >jdee-open-project-file         M-x ... RET
;; >jdee-project-create-project    M-x ... RET
;; >jdee-rename-class              M-x ... RET
;; >jdee-run                       M-x ... RET
;; >jdee-run-main-class            M-x ... RET
;; >jdee-save-project              M-x ... RET
;; >jdee-set-compile-options       M-x ... RET
;; >jdee-set-global-classpath      M-x ... RET
;; >jdee-show-class-source         M-x ... RET
;; >jdee-show-help                 M-x ... RET
;; >jdee-show-project-options      M-x ... RET
;; >jdee-show-run-options          M-x ... RET
;; >jdee-show-speedbar             M-x ... RET
;; >jdee-wiz-extend-abstract-class M-x ... RET
;; >jdee-wiz-get-set-methods       M-x ... RET
;; >jdee-wiz-implement-interface   M-x ... RET
;; >jdee-wiz-override-method       M-x ... RET
