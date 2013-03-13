; A macro to comment a region whathever the current mode
(defun uncomment-region (beg end)
  "Uncomment a region of text"
  (interactive "r")
  (comment-region beg end -1));

(global-set-key [C-M-d] (quote kill-word))

; Some useful key associations
(global-set-key [f4] (quote toggle-language))
(global-set-key [f5] (quote ispell-buffer))
(global-set-key [f6] (quote ispell-continue))

(global-set-key [f9] (quote dabbrev-expand))

(global-set-key [f11] (quote comment-region))
(global-set-key [f12] (quote uncomment-region))

;; Problems with copy/paste/yank from/to other applications
;; From: http://www.emacswiki.org/emacs/CopyAndPaste

;; From emacs < v23
(setq x-select-enable-clipboard t) ; as above
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; For emacs > v23
;;(transient-mark-mode 1)  ; Now on by default: makes the region act quite like the text "highlight" in many apps.
;;(setq shift-select-mode t) ; Now on by default: allows shifted cursor-keys to control the region.
;;(setq mouse-drag-copy-region nil)  ; stops selection with a mouse being immediately injected to the kill ring
;;(setq x-select-enable-primary nil)  ; stops killing/yanking interacting with primary X11 selection
;;(setq x-select-enable-clipboard t)  ; makes killing/yanking interact with clipboard X11 selection
;;; these will probably be already set to these values, leave them that way if so!
;;; (setf interprogram-cut-function 'x-select-text)
;;; (setf interprogram-paste-function 'x-cut-buffer-or-selection-value)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
