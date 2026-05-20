;; قائمة الحزم الأساسية
;; (vertico marginalia consult hl-todo company dracula)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package org-roam
  :ensure t                        ;; يقوم بتثبيت الحزمة إذا لم تكن موجودة
  :custom
  (org-roam-directory "~/org-roam/") ;; المسار الذي ستخزن فيه ملاحظاتك
  :config
  (org-roam-db-autosync-mode)      ;; مزامنة قاعدة البيانات مع التغييرات تلقائياً
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag))) ;; تحسين عرض الاقتراحات
  )

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/org-roam/")
  :bind (("C-c n f" . org-roam-node-find)      ;; البحث عن عقدة أو إنشاؤها
         ("C-c n i" . org-roam-node-insert)    ;; إدراج رابط لعقدة
         ("C-c n b" . org-roam-buffer-toggle)  ;; إظهار/إخفاء لوحة backlinks
         ("C-c n g" . org-roam-graph))         ;; عرض خريطة الشبكة
  :config
  (org-roam-db-autosync-mode))

;; themes
(use-package doom-themes
  :ensure t
  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; for treemacs users
  (doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  :config
  (load-theme 'doom-moonlight t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (nerd-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; إظهار أرقام الأسطر
(global-display-line-numbers-mode t)

;; تمييز الأقواس المتطابقة
(show-paren-mode t)

;; إغلاق الأقواس تلقائياً
(electric-pair-mode t)

;; تفعيل الإكمال التلقائي الأفضل
(vertico-mode t)  ;; أو استخدم `vertico` لمزيد من الخيارات

;; إظهار روابط Org بشكل جميل
(setq org-link-descriptive t)

;; إظهار صور SVG داخل Org-mode
(setq org-display-inline-images t)
(setq org-startup-with-inline-images t)

;; طي العناوين تلقائياً عند فتح الملف
(setq org-startup-folded 'show2levels)  ;; show2levels أو overview

(setq org-agenda-files '(
		 "~/org-agenda/Home/"
       		 "~/org-agenda/Education/"
	       	 "~/org-agenda/Learning/"
       		 "~/org-agenda/Personal/"
		 ))

(global-set-key (kbd "C-c a") #'org-agenda)

;; تغيير التنقل بين بداية ونهاية الملف
(global-set-key (kbd "C-c <") 'beginning-of-buffer)   ;; بداية الملف
(global-set-key (kbd "C-c >") 'end-of-buffer)         ;; نهاية الملف

;; tab settings
(setq-default indent-tabs-mode nil)   ;; استخدم مسافات بدل Tab
(setq tab-width 4)                    ;; عرض المسافة البادئة (4 مسافات مثلاً)

;; إظهار شريط الألسنة دائماً
(tab-bar-mode t)

;; fix some issues
(setq package-install-upgrade-built-in t)

;; إظهار رقم كل لسان بجانب اسمه
(setq tab-bar-show 1)

;; اختصارات مريحة للألسنة
(global-set-key (kbd "C-<tab>") 'tab-next)  ;; التبديل إلى التالي
(global-set-key (kbd "M-<tab>") 'tab-previous)  ;; التبديل إلى السابق

(use-package company
  :hook (after-init . global-company-mode) ;; تفعيل الوضع العام لكومباني
  :custom
  (company-idle-delay 0.2) ;; الوقت الذي ينتظره قبل عرض القائمة
  (company-minimum-prefix-length 2) ;; عدد الأحرف المطلوب كتابتها قبل الظهور
  (company-show-numbers t) ;; إظهار أرقام للاختيار السريع
  :bind
  (:map company-active-map
        ("C-n" . company-select-next) ;; تحويل الأسهم إلى التنقل
        ("C-p" . company-select-previous))
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-show-quick-access t nil nil "Customized with use-package company")
 '(package-selected-packages
   '(company consult corfu doom-themes dracula-theme eat eww-lnum hl-todo
             magit marginalia org org-roam treemacs vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
