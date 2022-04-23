# Black Magic Docs Site

## Development Stage

`npx mix watch`: Creates an instance of BrowserSync proxying to the virtual host configured in the `PRIMARY_SITE_URL` variable of the Craft CMS `.env` file. 

`npx mix`: Compiles and processes the `./resources` directories. The compiled files are passed to the `./public` directory. 

`npx mix -p`: Compiles and processes the ./resources directories for the production environment.  

### Development Technologies
* [Craft CMS 3](https://craftcms.com/docs/3.x/).
* [MySQL Community Server 8](https://dev.mysql.com/downloads/mysql/).
* [PHP 8.1.5](https://formulae.brew.sh/formula/php).
* Native Twig Templates

### Local Development Requirements
* [Laravel Valet](https://laravel.com/docs/9.x/valet).
* [PHP 8.1.5](https://formulae.brew.sh/formula/php).
* [MySQL Community Server 8](https://dev.mysql.com/downloads/mysql/).
* [Laravel Mix 6](https://laravel-mix.com).
* [Node.JS](https://nodejs.org/) v16.14.2 or the latest version of Long Term Support, managed by [NVM](https://github.com/nvm-sh/nvm).
* [NPM](https://npmjs.com).

### Craft CMS dependencies
* [Cloner](https://github.com/verbb/cloner).
* [Craft Mix](https://github.com/mister-bk/craft-plugin-mix).
* [Field Manager](https://github.com/verbb/field-manager).
* [Minify](https://github.com/nystudio107/craft-minify).
* [Redactor](https://github.com/craftcms/redactor).


### Front-End dependencies

