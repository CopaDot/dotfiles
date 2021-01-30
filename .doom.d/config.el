(setq user-full-name "Scotty Copa"
      user-mail-address "CopaDott@gmail.com")

(setq doom-font (font-spec :family "Hack Nerd Font" :size 13 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Hack Nerd Font Mono" :size 13)
      doom-big-font (font-spec :family "Hack Nerd Font" :size 26))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq doom-theme 'doom-one)
(map! :leader
      :desc "Load new theme"
      "h t" #'counsel-load-theme)

(defun prefer-horizontal-split ()
  (set-variable 'split-height-threshold nil t)
  (set-variable 'split-width-threshold 40 t)) ; make this as low as needed
(add-hook 'markdown-mode-hook 'prefer-horizontal-split)
(map! :leader
      :desc "Clone indirect buffer other window"
      "b c" #'clone-indirect-buffer-other-window)

(setq auto-save-default t)                      ;; Turns on auto-save
(setq auto-save-interval 200)                   ;; Defines character limit before autosaving
(setq backup-by-copying t)                      ;; Prevents clobbering of symlinks
(setq delete-old-versions t)                    ;; Deletes older versions
(setq kept-new-versions 6)                      ;; Defines what's considered new
(setq kept-old-versions 2)                      ;; Defines where it starts deleting.
(setq version-control t)                        ;; Use versioned backups
(setq make-backup-files t)                      ;; Makes backup files

(after! org
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/org/"
        org-agenda-files '("~/org/agenda.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-log-done 'time
        org-journal-dir "~/org/journal/"
        org-journal-date-format "%B %d, %Y (%A) "
        org-journal-file-format "%Y-%m-%d.org"
        org-hide-emphasis-markers t
        ;; ex. of org-link-abbrev-alist in action
        ;; [[arch-wiki:Name_of_Page][Description]]
        org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
          '(("google" . "http://www.google.com/search?q=")
            ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
            ("ddg" . "https://duckduckgo.com/?q=")
            ("wiki" . "https://en.wikipedia.org/wiki/"))
        org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
          '((sequence
             "TODO(t)"           ; A task that is ready to be tackled
             "BLOG(b)"           ; Blog writing assignments
             "GYM(g)"            ; Things to accomplish at the gym
             "PROJ(p)"           ; A project that contains other tasks
             "VIDEO(v)"          ; Video assignments
             "WAIT(w)"           ; Something is holding up this task
             "|"                 ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"           ; Task has been completed
             "CANCELLED(c)" )))) ; Task has been cancelled

(setq display-line-numbers-type t)              ;; Line numbers. nil = disabled, t = on, relative = relative numbers.
(map! :leader
      :desc "Toggle truncate lines"
      "t t" #'toggle-truncate-lines)

(setq undo-limit 80000000)                      ;; raise undo limit to 80Mb

(display-time-mode 1)                           ;; display time in the mode-line

(after! neotree
  (setq neo-smart-open t
        neo-window-fixed-size nil))
(after! doom-themes
  (setq doom-neotree-enable-variable-pitch t))
(map! :leader
      :desc "Toggle neotree file viewer"
      "t n" #'neotree-toggle
      :leader
      :desc "Open directory in neotree"
      "d n" #'neotree-dir)

(setq browse-url-browser-function 'eww-browse-url)
(map! :leader
      :desc "Eww web browser"
      "e w" #'eww
      :leader
      :desc "Eww reload page"
      "e R" #'eww-reload
      :leader
      :desc "Search web for text between BEG/END"
      "s w" #'eww-search-words)

(map! :leader
      :desc "Dired"
      "d d" #'dired
      :leader
      :desc "Dired jump to current"
      "d j" #'dired-jump
      (:after dired
        (:map dired-mode-map
         :leader
         :desc "Peep-dired image previews"
         "d p" #'peep-dired
         :leader
         :desc "Dired view file"
         "d v" #'dired-view-file)))
;; Make 'h' and 'l' go back and forward in dired. Much faster to navigate the directory structure!
(evil-define-key 'normal dired-mode-map
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-open-file) ; use dired-find-file instead if not using dired-open package
;; If peep-dired is enabled, you will get image previews as you go up/down with 'j' and 'k'
(evil-define-key 'normal peep-dired-mode-map
  (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)
;; Get file icons in dired
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '(("gif" . "sxiv")
                              ("jpg" . "sxiv")
                              ("png" . "sxiv")
                              ("mkv" . "vlc")
                              ("mp4" . "vlc")))

(custom-set-variables
 '(elfeed-feeds
   (quote
    (("https://www.reddit.com/r/linux.rss" reddit linux)
     ("https://www.gamingonlinux.com/article_rss.php" gaming linux)
     ("https://hackaday.com/blog/feed/" hackaday linux)
     ("https://opensource.com/feed" opensource linux)
     ("https://linux.softpedia.com/backend.xml" softpedia linux)
     ("https://itsfoss.com/feed/" itsfoss linux)
     ("https://www.zdnet.com/topic/linux/rss.xml" zdnet linux)
     ("https://www.phoronix.com/rss.php" phoronix linux)
     ("http://feeds.feedburner.com/d0od" omgubuntu linux)
     ("https://www.computerworld.com/index.rss" computerworld linux)
     ("https://www.networkworld.com/category/linux/index.rss" networkworld linux)
     ("https://www.techrepublic.com/rssfeeds/topic/open-source/" techrepublic linux)
     ("https://betanews.com/feed" betanews linux)
     ("http://lxer.com/module/newswire/headlines.rss" lxer linux)
     ("https://distrowatch.com/news/dwd.xml" distrowatch linux)))))

(emms-all)
(emms-default-players)
(emms-mode-line 1)
(emms-playing-time 1)
(setq emms-source-file-default-directory "~/Music/Non-Classical/70s-80s/"
      emms-playlist-buffer-name "*Music*"
      emms-info-asynchronously t
      emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
(map! :leader
      :desc "Go to emms playlist"
      "a a" #'emms-playlist-mode-go
      :leader
      :desc "Emms pause track"
      "a x" #'emms-pause
      :leader
      :desc "Emms stop track"
      "a s" #'emms-stop
      :leader
      :desc "Emms play previous track"
      "a p" #'emms-previous
      :leader
      :desc "Emms play next track"
      "a n" #'emms-next)

(setq ivy-posframe-display-functions-alist
      '((swiper                     . ivy-posframe-display-at-point)
        (complete-symbol            . ivy-posframe-display-at-point)
        (counsel-M-x                . ivy-display-function-fallback)
        (counsel-esh-history        . ivy-posframe-display-at-window-center)
        (counsel-describe-function  . ivy-display-function-fallback)
        (counsel-describe-variable  . ivy-display-function-fallback)
        (counsel-find-file          . ivy-display-function-fallback)
        (counsel-recentf            . ivy-display-function-fallback)
        (counsel-register           . ivy-posframe-display-at-frame-bottom-window-center)
        (dmenu                      . ivy-posframe-display-at-frame-top-center)
        (nil                        . ivy-posframe-display))
      ivy-posframe-height-alist
      '((swiper . 20)
        (dmenu . 20)
        (t . 10)))
(ivy-posframe-mode 1) ; 1 enables posframe-mode, 0 disables it.

(map! :leader
      :desc "Ivy push view"
      "v p" #'ivy-push-view
      :leader
      :desc "Ivy switch view"
      "v s" #'ivy-switch-view)

(after! mastodon
  (setq mastodon-instance-url "https://distrotoot.com/"))

;;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
;;(require 'smtpmail)
;;(setq user-mail-address "derek@distrotube.com"
;;      user-full-name  "Derek Taylor"
      ;; I have my mbsyncrc in a different folder on my system, to keep it separate from the
      ;; mbsyncrc available publicly in my dotfiles. You MUST edit the following line.
      ;; Be sure that the following command is: "mbsync -c ~/.config/mu4e/mbsyncrc -a"
;;      mu4e-get-mail-command "mbsync -c ~/.config/mu4e-dt/mbsyncrc -a"
;;      mu4e-update-interval  300
;;      mu4e-main-buffer-hide-personal-addresses t
;;      message-send-mail-function 'smtpmail-send-it
;;      starttls-use-gnutls t
;;      smtpmail-starttls-credentials '(("smtp.1and1.com" 587 nil nil))
;;      mu4e-sent-folder "/account-1/Sent"
;;      mu4e-drafts-folder "/account-1/Drafts"
;;      mu4e-trash-folder "/account-1/Trash"
;;      mu4e-maildir-shortcuts
;;      '(("/account-1/Inbox"      . ?i)
;;        ("/account-1/Sent Items" . ?s)
;;        ("/account-1/Drafts"     . ?d)
;;        ("/account-1/Trash"      . ?t)))

;; (defvar my-mu4e-account-alist
;;   '(("acc1-domain"
;;      (mu4e-sent-folder "/acc1-domain/Sent")
;;      (mu4e-drafts-folder "/acc1-domain/Drafts")
;;      (mu4e-trash-folder "/acc1-domain/Trash")
;;      (mu4e-compose-signature
;;        (concat
;;          "Ricky Bobby\n"
;;          "acc1@domain.com\n"))
;;      (user-mail-address "acc1@domain.com")
;;      (smtpmail-default-smtp-server "smtp.domain.com")
;;      (smtpmail-smtp-server "smtp.domain.com")
;;      (smtpmail-smtp-user "acc1@domain.com")
;;      (smtpmail-stream-type starttls)
;;      (smtpmail-smtp-service 587))
;;     ("acc2-domain"
;;      (mu4e-sent-folder "/acc2-domain/Sent")
;;      (mu4e-drafts-folder "/acc2-domain/Drafts")
;;      (mu4e-trash-folder "/acc2-domain/Trash")
;;      (mu4e-compose-signature
;;        (concat
;;          "Suzy Q\n"
;;          "acc2@domain.com\n"))
;;      (user-mail-address "acc2@domain.com")
;;      (smtpmail-default-smtp-server "smtp.domain.com")
;;      (smtpmail-smtp-server "smtp.domain.com")
;;      (smtpmail-smtp-user "acc2@domain.com")
;;      (smtpmail-stream-type starttls)
;;      (smtpmail-smtp-service 587))
;;     ("acc3-domain"
;;      (mu4e-sent-folder "/acc3-domain/Sent")
;;      (mu4e-drafts-folder "/acc3-domain/Drafts")
;;      (mu4e-trash-folder "/acc3-domain/Trash")
;;      (mu4e-compose-signature
;;        (concat
;;          "John Boy\n"
;;          "acc3@domain.com\n"))
;;      (user-mail-address "acc3@domain.com")
;;      (smtpmail-default-smtp-server "smtp.domain.com")
;;      (smtpmail-smtp-server "smtp.domain.com")
;;      (smtpmail-smtp-user "acc3@domain.com")
;;      (smtpmail-stream-type starttls)
;;      (smtpmail-smtp-service 587))))

;;(defun my-mu4e-set-account ()
;;  "Set the account for composing a message."
;;  (let* ((account
;;          (if mu4e-compose-parent-message
;;              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
;;                (string-match "/\\(.*?\\)/" maildir)
;;                (match-string 1 maildir))
;;            (completing-read (format "Compose with account: (%s) "
;;                                     (mapconcat #'(lambda (var) (car var))
;;                                                my-mu4e-account-alist "/"))
;;                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
;;                             nil t nil nil (caar my-mu4e-account-alist))))
;;         (account-vars (cdr (assoc account my-mu4e-account-alist))))
;;    (if account-vars
;;        (mapc #'(lambda (var)
;;                  (set (car var) (cadr var)))
;;              account-vars)
;;      (error "No email account found"))))

;;(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

(map! :leader
      :desc "Evaluate elisp in buffer"
      "e b" #'eval-buffer
      :leader
      :desc "Evaluate defun"
      "e d" #'eval-defun
      :leader
      :desc "Evaluate elisp expression"
      "e e" #'eval-expression
      :leader
      :desc "Evaluate last sexpression"
      "e l" #'eval-last-sexp
      :leader
      :desc "Evaluate elisp in region"
      "e r" #'eval-region)

(map! :leader
      :desc "Copy to register"
      "r c" #'copy-to-register
      :leader
      :desc "Frameset to register"
      "r f" #'frameset-to-register
      :leader
      :desc "Insert contents of register"
      "r i" #'insert-register
      :leader
      :desc "Jump to register"
      "r j" #'jump-to-register
      :leader
      :desc "List registers"
      "r l" #'list-registers
      :leader
      :desc "Number to register"
      "r n" #'number-to-register
      :leader
      :desc "Interactively choose a register"
      "r r" #'counsel-register
      :leader
      :desc "View a register"
      "r v" #'view-register
      :leader
      :desc "Window configuration to register"
      "r w" #'window-configuration-to-register
      :leader
      :desc "Increment register"
      "r +" #'increment-register
      :leader
      :desc "Point to register"
      "r SPC" #'point-to-register)

;;(map! :leader
;;      :desc "Ssh into distrotube.com"
;;      "\\ d" #'(lambda () (interactive) (find-file "/scp:derek@distrotube.com"))
;;      :leader
;;      :desc "Ssh into my nextcloud"
;;      "\\ n" #'(lambda () (interactive) (find-file "/scp:derek@distrotube.net")))

(map! :leader
      :desc "Winner redo"
      "w <right>" #'winner-redo
      :leader
      :desc "Winner undo"
      "w <left>" #'winner-undo)
