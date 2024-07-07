;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Файл конфигурации GNU/EMACS
;; Автор: JAkutenshi
;; Дата последней правки: <2024-05-20>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Определение репозиториев ELPA и MELPA, загрузка пакетов
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
;; Устанавливаем приоритет репозиториев на случай если какие-то недоступны
      package-archive-priorities
      '(("GNU ELPA"     . 10)
        ("MELPA Stable" . 5)
        ("MELPA"        . 0)))
;; Загружаем установленные пакеты
(package-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Установка пакетов
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; Пакет для загрузки и описания настроек загруженных пакетов
(require 'use-package)

;;;; Цветовая тема
;(use-package zenburn-theme
;    :ensure t
;    :config (load-theme 'zenburn t))

;;;; Загружаем org
;(use-package org
;    :ensure t)

(add-to-list 'load-path "~/bin/git_src/org-mode/lisp")


;;;; Кружки вместо звёздочек для заголовков Org-mode
;(use-package org-bullets
;    :ensure t)
;; ToDo: надо бы разобраться что это и как это записать в настройку пакета
;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;;; Приоритеты в виде букв в квадрате (меньше символов для приоритетов и выделяет их)
;(use-package org-fancy-priorities
;  :diminish
;  :ensure t
;  :hook (org-mode . org-fancy-priorities-mode)
;  :config
;  (setq org-fancy-priorities-list '("🆂" "🅰" "🅱" "🅲" "🅳" "🅵" )))

;;;; Система ведения заметок на основе org-mode
;(use-package org-roam
;  :ensure t)

;    :custom
;  (org-roam-directory (file-truename "~/.config/emacs/roam/"))
;  :bind (("C-c n l" . org-roam-buffer-toggle)
;          ("C-c n f" . org-roam-node-find)
;          ("C-c n g" . org-roam-graph)
;          ("C-c n i" . org-roam-node-insert)
;          ("C-c n c" . org-roam-capture)
;          ;; Dailies
;          ("C-c n j" . org-roam-dailies-capture-today))
;   :config
;   ;; If you're using a vertical completion framework, you might want a more informative completion interface
;  ;; (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
;  (org-roam-setup)
;  (org-roam-db-autosync-mode)
;  ;; If using org-roam-protocol
;  (require 'org-roam-protocol))
;(defalias 'org-font-lock-ensure #'font-lock-ensure)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Общие настройки
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; Включение отображения номеров строк буфера
(global-display-line-numbers-mode t)
(setq display-line-numbers-width-start 6)
(setq display-line-numbers-grow-only t)
;;;; Отключаем файлы бэкапов и автосохранений
(setq make-backup-files nil)
(setq auto-save-default nil)
;;;; Временые файлы бэкапов и сохранений переносим в отдельную директорию
(setq backup-directory-alist         `((".*" . "~/.config/emacs/.autosave")))
(setq auto-save-file-name-transforms `((".*" "~/.config/emacs/.autosave" t)))
;;;; Убираем начальные экраны
(setq-default inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
;;;; Убираем из чернового буфера текст
(setq initial-scratch-message "")
;;;; Задаём максимальную длину строки для auto-fill-mode
(setq-default fill-column 120)
;;;; Убираем панель инструментов
(tool-bar-mode -1)
;;;; Оставляем главное меню
;;;; TODO: а оно не по-умолчанию ли такое?
(menu-bar-mode  t)
;;;; Убираем полосу прокрутки
(scroll-bar-mode -1)
;;;; Убираем подсвечивание строки с курсором 
;;;; TODO: а оно не по-умолчанию ли такое?
(global-hl-line-mode -1)
;;;; Включение отображения текущей строки и позициеи курсора в строке (line,col)
(column-number-mode 1)
;;;; Включение "визуального" переноса строк (без образания строки)
(add-hook 'text-mode-hook 'visual-line-mode)
;;;; Устанавливаем основной шрифт
;; (set-frame-font "IBM Plex Mono 14")
;;;; При открытии разворачиваем окно на весь экран
(toggle-frame-maximized)
;;;; Устанавливаем размер табуляции в 4 пробела
(setq-default tab-width 4)
;;;; Запрещаем выравнивание табуляцией
(setq-default indent-tabs-mode nil)
;;;; Сохраняем подсвечивание найденных подстрок через isearch при пролистывании буффера
(setq isearch-allow-scroll t)
;;;; В целом пытаемся отключить автоматическое выравнивение кода
; (electric-indent-mode -1)

;;;; Dashboard - заглавный экран при запуске
;(use-package dashboard
;    :ensure t
;    :config (dashboard-setup-startup-hook)
;    (display-line-numbers-mode 0))
;;;; TODO: Перенести настройки в настройку пакета
;(setq dashboard-banner-logo-title "Welcome to Emacs")
;(setq dashboard-startup-banner 'logo)
;(setq dashboard-center-content t)
;(setq dashboard-set-heading-icons t)
;(setq dashboard-set-file-icons t)
;(setq dashboard-items 
;      '((recents . 15)
;        (bookmarks . 15)))  

;;;; Отображение красивых иконок в Dashboard 
;(use-package all-the-icons
;    :ensure t
;	:if (display-graphic-p))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Настройка для подсказки последних 25 файлов
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Настройки Org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Изменения комбинаций клавиш
;;;; Включить org-mode для текущего буффера
(global-set-key (kbd "C-c o") 'org-mode)
;;;; Открыть Org-agenda
(global-set-key (kbd "C-c a") 'org-agenda)
;;;; Открыть Org-Capture для быстрого сохранения материалов
(global-set-key (kbd "C-c c") 'org-capture)
;;;; Свернуть-развернуть ссылки
(global-set-key (kbd "C-c t l") 'org-toggle-link-display)
;;;; Раскрываем всё содержимое при открытии org-файла
(setq org-startup-folded t)
;;;; Задаёт org-agenda использовать текущее окно
(setq org-agenda-window-setup 'current-window)
;;;; Включаем автовыравнивание в org-файлах по-умолчанию.
(setq org-startup-indented t)
;;;; Задаём директорию с org-файлами, отслеживаемых для построения расписания
(setq org-agenda-files `("~/documents/org/journal", "~/documents/job/gridgain/org"))
;;;; Включаем автоперенос строки в org-файлах по-умолчанию
(add-hook 'org-mode-hook #'auto-fill-mode)
;;;; Исправляем цветовыделение org-синтаксиса с кавычками внутри ~~ и ==
;(setcar (nthcdr 2 org-emphasis-regexp-components) " \t\r\n")
;(org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)

;; Экспорт в JIRA
(use-package ox-jira
    :ensure t)

;; Пакет, необходимый для babel-интерпретации Scheme
(use-package geiser
    :ensure t)

(use-package geiser-mit
    :ensure t)

;;;; Подключение языков для исполнения в блоках с кодом
(use-package org-babel
    :ensure t)	     
(org-babel-do-load-languages 'org-babel-load-languages
                             '((python . t) 
                               (C      . t) 
                               (java   . t)
                               (scheme . t)))

;;;; Использование умных кавычек при экспорти в LaTeX/PDF
(setq org-export-with-smart-quotes t)
