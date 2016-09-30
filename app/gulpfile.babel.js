'use strict';

import gulp from 'gulp';
import { exec } from 'child_process';
import watch from 'gulp-watch';

gulp.task('server:restart', (callback) => {

});

gulp.task('watch', () => {
	return watch('server/**/*.js', { usePolling: true }, () => {
		console.log('Restarting server...');
		exec('ansible-playbook -i ../ansible/inventories/vagrant ../ansible/app_web_restart.yml --become', (err, stdout, stderr) => {
			console.log('Server restarted.');
		});
	});
});