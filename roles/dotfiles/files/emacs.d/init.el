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
;; Tabの代わりにスペースでインデント
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2 indent-tabs-mode nil)

;; 行末空白の表示
(when (boundp 'show-trailing-whitespace)
  (setq-default show-trailing-whitespace t))
(set-face-background 'trailing-whitespace "purple4")

;; ファイル末にスペース
(setq require-final-newline t)

;; backup file
(setq make-backup-files t)
(setq backup-directory "~/.bak.emacs")
(if (and (boundp 'backup-directory)
         (not (fboundp 'make-backup-file-name-original)))
    (progn
      (fset 'make-backup-file-name-original
            (symbol-function 'make-backup-file-name))
      (defun make-backup-file-name (filename)
        (if (and (file-exists-p (expand-file-name backup-directory))
                 (file-directory-p (expand-file-name backup-directory)))
            (concat (expand-file-name backup-directory) 
                    "/" (file-name-nondirectory filename))
          (make-backup-file-name-original filename)))))

;;Packages
(el-get-bundle auto-complete)

;; Golang
(el-get-bundle go-autocomplete)
(el-get-bundle go-eldoc)
(el-get-bundle go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)


;; Ansible
(el-get-bundle yaml-mode)
