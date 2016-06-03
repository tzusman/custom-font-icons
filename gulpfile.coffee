gulp = require 'gulp'
sass = require 'gulp-sass'
iconfont = require 'gulp-iconfont'
iconfontCss = require 'gulp-iconfont-css'
replace = require 'gulp-replace'

fontName = 'custom-font-icons'

gulp.task 'build', ->

  gulp
    .src([ 'src/svg/*.svg' ])
    .pipe(iconfontCss(
      fontName: fontName
      path: 'src/icons.scss'
      targetPath: '../icons.scss'
      fontPath: 'fonts/'
      prependUnicode: true
    ))
    .pipe(iconfont(
      fontName: fontName
      prependUnicode: false
      formats: [ 'ttf', 'eot', 'woff' ]
      timestamp: Math.round(Date.now()/1000)
    ))
    .on('glyphs', (glyphs, opts) ->
      console.log( glyphs, opts )
    )
    .pipe gulp.dest('build/fonts')

gulp.task 'css', ->
  gulp
    .src([ 'build/icons.scss' ])
    .pipe(sass().on('error', sass.logError))
    .pipe gulp.dest('build')

gulp.task 'watch', ->
  gulp.watch 'src/svg/*.svg', ['build']
  gulp.watch 'build/icons.scss', ['css']

gulp.task 'default', ['build', 'watch']
