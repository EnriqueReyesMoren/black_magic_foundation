SHELL := bash
ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

dev:
>npx mix watch
.PHONY: dev

staging:
>npx mix
.PHONY: build

plugins: nav manager cloner image-resizer freeform
.PHONY: plugins

minify:
>composer require nystudio107/craft-minify
>@sleep 1
>php craft plugin/install minify
>@sleep 1
.PHONY: minify

mix:
>composer require misterbk/mix
>@sleep 1
>php craft plugin/install mix
>@sleep 1
.PHONY: mix

redactor:
>composer require craftcms/redactor
>@sleep 1
>php craft plugin/install redactor
>@sleep 1
.PHONY: redactor

seo:
>composer require ether/seo
>@sleep 1
>php craft plugin/install seo
>@sleep 1
.PHONY: seo

neo:
>composer require spicyweb/craft-neo
>@sleep 1
>php craft plugin/install neo
>@sleep 1
.PHONY: neo

nav:
>composer require verbb/navigation
>@sleep 1
>php craft plugin/install navigation
>@sleep 1
.PHONY: nav

manager: 
>composer require verbb/field-manager
>@sleep 1
>php craft plugin/install field-manager
>@sleep 1
.PHONY: manager

cloner: 
>composer require verbb/cloner
>@sleep 1
>php craft plugin/install cloner
>@sleep 1
.PHONY: cloner

image-resizer: 
>composer require verbb/image-resizer
>@sleep 1
>php craft plugin/install image-resizer
>@sleep 1
.PHONY: image-resizer

freeform:
>composer require solspace/craft-freeform
.PHONY: freeform

rename-webroot:
>@mv -f ./web ./public
.PHONY: rename-webroot

