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
