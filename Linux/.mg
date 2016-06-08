global-set-key "\e[H" beginning-of-line
global-set-key "\e[F" end-of-line

global-set-key "\e[1;5C" forward-word
global-set-key "\e[1;5D" backward-word
global-set-key "\e[1;3C" forward-word
global-set-key "\e[1;3D" backward-word

; make C-M-up/dwn keys move by paragraph
;global-set-key "\e[1;5B" forward-block-of-lines ; do not exists in mg
;global-set-key "\e[1;5A" backward-block-of-lines ; do not exists in mg
global-set-key "\e[1;5B" forward-paragraph
global-set-key "\e[1;5A" backward-paragraph

global-set-key "\e[1;5H" beginning-of-buffer
global-set-key "\e[1;5F" end-of-buffer

;;global-set-key "\et" transpose-words

;; allow accentuated chars
meta-key-mode

;; bind ESC-g with goto-line as in XEmacs
global-set-key "\eg" goto-line

;; Makes delete key work
global-set-key "\e[3~" delete-char
global-set-key "" delete-backward-char

;; always end a file with a newline - prevents questions on exit
;(require-final-newline 0)

;; Disables backup files
make-backup-files nil

;; Turn on column numbering in status line
;;(column-number-mode t)

;set-default-mode blink
;auto-indent-mode
;dired-backup-unflag

; Makes ESC-suppr and ESC-dele erase words
global-set-key "\e\e[3~" kill-word
global-set-key "\e^H" backward-kill-word
