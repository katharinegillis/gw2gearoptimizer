'use strict';

import gulp from 'gulp';
import { exec } from 'child_process';
import watch from 'gulp-watch';

let server_restart = (callback) => {
	process.chdir('..');
	exec('sh restart-vagrant.sh', (err, stdout, stderr) => {
		console.log(stdout);
		console.log(stderr);
		callback(err);
	});
};

gulp.task('server:restart', (callback) => {
	server_restart(callback);
});

gulp.task('watch', () => {
	return watch('server/**/*.js', { usePolling: true }, () => {
		gulp.start('server:restart');
	});
});