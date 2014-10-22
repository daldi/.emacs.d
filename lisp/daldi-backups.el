(setq make-backup-files nil)
;; Activate backup-each-save.el
(require 'backup-each-save)
(add-hook 'after-save-hook 'backup-each-save)
(defun backup-each-save-filter (filename)
  (let ((ignored-filenames
         '("^/tmp" "semantic.cache$" "\\.emacs-places$"
           "\\.recentf$" ".newsrc\\(\\.eld\\)?"))
        (matched-ignored-filename nil))
    (mapc
     (lambda (x)
       (when (string-match x filename)
         (setq matched-ignored-filename t)))
     ignored-filenames)
    (not matched-ignored-filename)))
(setq backup-each-save-filter-function 'backup-each-save-filter)

;; TODO
;; Make the below work like backup-each-save and save each backup in it's own relative path

;; Backup versioned files
;; (setq vc-make-backup-files t)

;(setq version-control t ;; Use version numbers for backups.
;      kept-new-versions 10 ;; Number of newest versions to keep.
;      kept-old-versions 2 ;; Number of oldest versions to keep.
;      delete-old-versions t ;; Don't ask to delete excess backup versions.
;      backup-by-copying t) ;; Copy all files, don't rename them.

;; Default and per-save backups go here:
;(let ((bfn (buffer-file-name)))
;  (setq backup-directory-alist '(("" . (backup-each-save-compute-directory bfn))))
;  )
(defun force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    ;; Override the default parameters for per-session backups.
    (let ((backup-directory-alist '(("" . "~/.filebackups.emacs/per-session")))
          (kept-new-versions 3))
      (backup-buffer)))
  ;; Make a "per save" backup on each save.  The first save results in
  ;; both a per-session and a per-save backup, to keep the numbering
  ;; of per-save backups consistent.
    (setq buffer-backed-up nil))

;;(add-hook 'before-save-hook  'force-backup-of-buffer)
