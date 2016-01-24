# @file
# @author Katharine Cordes
# @date   1/21/16
# @brief  Defines the gulp build tasks.

gulp         = require 'gulp'
gutil        = require 'gulp-util'
gulpif       = require 'gulp-if'
streamify    = require 'gulp-streamify'
autoprefixer = require 'gulp-autoprefixer'
cssmin       = require 'gulp-cssmin'
less         = require 'gulp-less'
concat       = require 'gulp-concat'
plumber      = require 'gulp-plumber'
source       = require 'vinyl-source-stream'
browserify   = require 'browserify'
watchify     = require 'watchify'
uglify       = require 'gulp-uglify'
envify       = require 'envify/custom'
fs           = require 'fs'
join         = require('path').join

config       = require './backend/config/config'

# Set up the environment.
environment = process.env.NODE_ENV or 'development'

production = environment is 'production'

dependencies = [
	'react'
	'react-router'
	'react-dom'
	'events'
	'object-assign'
	'flux'
	'keymirror'
	'bluebird'
	'randomstring'
	'request'
	'url'
]

entry_point = 'frontend/main.cjsx'
css_entry_point = 'frontend/less/main.less'

# Compile the third-party JS libraries into a single file.
gulp.task 'vendor', () ->
	return gulp.src [
		'bower_components/jquery/dist/jquery.js',
		'bower_components/bootstrap/dist/js/bootstrap.js'
	]
	.pipe concat('vendor.js')
	.pipe gulpif(production, streamify(uglify(mangle: false)))
	.pipe gulp.dest('public/js')

# Bundle and minify the third-party JS libraries for faster performance.
gulp.task 'browserify-vendor', () ->
	return browserify()
		.require dependencies
		.bundle()
		.pipe source('vendor.bundle.js')
		.pipe gulpif(production, streamify(uglify(mangle: false)))
		.pipe gulp.dest('public/js')

# Compile the project files.
gulp.task 'browserify', ['browserify-vendor'], () ->
	return browserify entry_point
		.external dependencies
		.transform 'coffee-reactify'
		.transform envify(
			_: 'purge'
			NODE_ENV: environment
			BASE_URL: config.base_url
		)
		.bundle()
		.pipe source('bundle.js')
		.pipe gulpif(production, streamify(uglify(mangle: false)))
		.pipe gulp.dest('public/js')

# Compile the project files and watch for changes. Recompile when changes happen.
gulp.task 'browserify-watch', ['browserify-vendor'], () ->
	rebundle = () ->
		start = Date.now()
		return bundler.bundle()
			.on 'error', (err) ->
				gutil.log gutil.colors.red(err.toString())
			.on 'end', () ->
				gutil.log gutil.colors.green('Finished rebundling in ', (Date.now() - start) + 'ms.')
			.pipe source('bundle.js')
			.pipe gulp.dest('public/js')

	bundler = watchify browserify(entry_point, watchify.args)
	bundler.external dependencies
	bundler.transform 'coffee-reactify'
	bundler.transform envify(
		_: 'purge'
		NODE_ENV: environment
		BASE_URL: config.base_url
	)
	bundler.on 'update', rebundle
	return rebundle()

# Compile the vendor css.
gulp.task 'vendor-styles', () ->
	return gulp.src [
		'bower_components/bootstrap/dist/css/bootstrap.css'
	]
	.pipe concat('vendor.css')
	.pipe gulpif(production, cssmin())
	.pipe gulp.dest('public/css')

# Compile the less stylesheets.
gulp.task 'styles', ['vendor-styles'], () ->
	return gulp.src css_entry_point
		.pipe plumber()
		.pipe less()
		.pipe autoprefixer()
		.pipe gulpif(production, cssmin())
		.pipe gulp.dest('public/css')

gulp.task 'watch', ['vendor-styles'],  () ->
	gulp.watch 'frontend/less/**/*.less', ['styles']

# Grouped tasks.
gulp.task 'default', ['styles', 'vendor', 'browserify-watch', 'watch']
gulp.task 'build', ['styles', 'vendor', 'browserify']