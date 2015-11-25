;;
;; el-get
;;
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;
;; auto-complete
;;
(el-get-bundle auto-complete)
(ac-config-default)

;;
;; helm
;;
(el-get-bundle helm)
(require 'helm-config)
(helm-mode 1)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-c j") 'helm-mini)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;;
;; helm-swoop
;;
(el-get-bundle helm-swoop)
(require 'helm-swoop)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;;
;; key bind
;;
(global-set-key (kbd "C-h") 'delete-backward-char)
(defun other-window-or-split ()
  "Split window horizontally if frame does not has tow windows."
  (interactive)
  (when (one-window-p) (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)
(define-key dired-mode-map (kbd "C-t") 'other-window)


;;
;; yasnippet
;;
(el-get-bundle yasnippet)
(require 'yasnippet)
(yas-global-mode 1)

;;
;; anzu
;;
(el-get-bundle anzu)
(global-anzu-mode +1)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;;
;; theme
;;
(load-theme 'misterioso t)
(setq default-frame-alist
      (append (list '(cursor-color . "white")) default-frame-alist))

;;
;; font size
;;
(when window-system
  (set-face-font
   'default
   "-unknown-Ubuntu Mono-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1"))

;;
;; line number
;;
(when window-system
  ;;デフォルトで linum-mode を有効にする
  (global-linum-mode t)
  ;;3桁分のスペースを確保
  (setq linum-format "%3d"))

;;
;; 画面の要素を消す
;;
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;
;; quickrun
;;
(el-get-bundle quickrun)
(require 'quickrun)
(global-set-key (kbd "C-c c") 'quickrun)

;;
;; 自動保存
;;
(el-get-bundle elpa:auto-save-buffers-enhanced)
(require 'auto-save-buffers-enhanced)
(auto-save-buffers-enhanced t)
(setq auto-save-buffers-enhanced-include-regexps '(".+"))
(setq auto-save-buffers-enhanced-exclude-regexps '("\\.el$"))
(setq auto-save-buffers-enhanced-interval 0.5)
;; Wrote メッセージを抑制
(setq auto-save-buffers-enhanced-quiet-save-p t)

;;
;; yes/no の入力を y/n に
;;
(defalias 'yes-or-no-p 'y-or-n-p)

;;
;; 起動後に *scratch* バッファを出す
;;
(setq inhibit-startup-message t)

;;
;; magit
;;
(el-get-bundle magit)
(require 'magit)

;;
;; flycheck
;;
(el-get-bundle flycheck)
(add-hook 'python-mode-hook (lambda () (flycheck-mode 1)))

;;
;; sqlplus
;;
(el-get-bundle sql)
(require 'sql)

;;
;; gradle
;;
(el-get-bundle gradle-mode)
(require 'gradle-mode)
(gradle-mode 1)

;;
;; groovy
;;
(el-get-bundle groovy-mode)
(require 'groovy-mode)
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))

;; バックアップファイルを作らない
(setq backup-inhibited t)

;;
;; etags-u
;;
(el-get-bundle etags-u)
(require 'etags-u)
