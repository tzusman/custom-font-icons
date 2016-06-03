gulp = require 'gulp'
iconfont = require 'gulp-iconfont'
iconfontCss = require 'gulp-iconfont-css'

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
    .pipe gulp.dest('build/svg')
    .pipe(iconfont(
      fontName: fontName
    ))
    .pipe gulp.dest('build/fonts')

gulp.task 'watch', ->
  gulp.watch 'src/svg/*.svg', ['build']

gulp.task 'default', ['build','watch']
