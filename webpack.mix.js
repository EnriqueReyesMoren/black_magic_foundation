const mix = require('laravel-mix');
require('laravel-mix-purgecss');
require('laravel-mix-criticalcss');

const path = require('path');

mix
  .js('resources/js/app.js', 'js/')
  .sass('resources/sass/app.scss', 'css/')
  .options({
    postCss: [require('cssnano')()],
  })
  .setPublicPath('public')
  .purgeCss({
    extend: {
      content: [
        path.join(__dirname, 'templates/**/*.twig'),
        path.join(__dirname, 'resources/**/*.js'),
        path.join(__dirname, 'resources/**/*.svg'),
        path.join(__dirname, 'resources/**/*.scss')
      ],
      extensions: ['twig', 'html', 'js', 'scss', 'svg'],
    }
  })
  .copy('resources/fonts', 'public/fonts')
  .copy('resources/images', 'public/images')
  .browserSync({
    proxy: process.env.PRIMARY_SITE_URL,
    files: ['templates/**/*.twig', 'public/css/**/*.css', 'public/js/**/*.js'],
    browser: 'google chrome'
  });


if (mix.inProduction()) {
  mix.version();
} else {
  mix.sourceMaps(true, 'source-map');
}