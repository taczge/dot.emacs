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
