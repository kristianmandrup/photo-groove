var gulp = require('gulp');
var elm = require('gulp-elm');
var plumber = require('gulp-plumber');
var del = require('del');
var livereload = require('gulp-livereload')
var gutil = require('gulp-util')

plugins = require('gulp-load-plugins')({
  rename: {
    'gulp-live-server': 'serve'
  }
});

var port = 3001
var reloadOpts = {
  // port: port,
  // start: true,
  // reloadPage: 'index.html'
}


// builds elm files and static resources (i.e. html and css) from src to dist folder
var paths = {
  dest: 'dist',
  elm: 'src/*.elm',
  staticAssets: 'src/*.{html,css}'
};

gulp.task('clean', function (cb) {
  del([paths.dest], cb);
});

gulp.task('elm-init', elm.init);

gulp.task('elm', ['elm-init'], function () {
  return gulp.src(paths.elm)
    .pipe(plumber())
    .pipe(elm())
    .pipe(gulp.dest(paths.dest)).on('error', gutil.log)
    .pipe(livereload(reloadOpts));
});

gulp.task('elm-bundle', ['elm-init'], function () {
  return gulp.src('src/*.elm')
    .pipe(elm.bundle('bundle.js'))
    .pipe(gulp.dest(paths.dest));
});

gulp.task('watch', function () {
  gulp.watch(paths.elm, ['elm']);
  // gulp.watch(paths.staticAssets, ['static']);
});

gulp.task('reload', function () {
  livereload.listen(reloadOpts);
  gulp.watch(paths.elm, ['elm']);
});

// gulp.task('staticAssets', function() {
//   return gulp.src(paths.staticAssets)
//     .pipe(plumber())
//     .pipe(gulp.dest(paths.dest));
// });

gulp.task('build', ['elm']);
gulp.task('dev', ['build', 'watch']);
gulp.task('default', ['build']);

gulp.task('serve', function () {
  var server = plugins.serve.static('/', port);
  server.start();
  gulp.watch([paths.dest + '/*', 'index.html'], function (file) {
    server.notify.apply(server, [file]);
  });
});