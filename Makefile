SHELL := bash
ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >
all: delete-modules delete-jsons delete-resources end-script

clean: all
>@echo Preparing main repository for production deployment 
.PHONY: clean

delete-modules:
>@rm -rf node_modules
>@sleep .5
.PHONY: delete-modules

delete-jsons:
>@rm -rf package.json
>@sleep .5
>@rm -rf package-lock.json
>@sleep .5
.PHONY: delete-jsons

delete-resources:
>@rm -rf resources
>@sleep 1
.PHONY: delete-resources

end-script:
>@echo All done! now commit and push to the remote repository
>@sleep .5
.PHONY: end-script

delete-webpack:
>@rm -rf webpack.mix.js
>@sleep .5
.PHONY: delete-webpack

delete-nvm:
>@rm -rf .nvmrc
>@sleep .5
.PHONY: delete-nvm

delete: delete-webpack delete-nvm
.PHONY: delete