'use strict';

import * as gulp from 'gulp';
import { exec } from 'child_process';
import * as watch from 'gulp-watch';

let server_restart = () => {
	console.log('Restarting server...');
	exec('ansible-playbook -i ../ansible/inventories/vagrant ../ansible/app_web_restart.yml --become', (err, stdout, stderr) => {
		console.log('Server restarted.');
	});
};

gulp.task('watch:win', () => {
	return watch('server/**/*.js', { usePolling: true }, () => {
		server_restart();
	});
});

gulp.task('watch', () => {
	return watch('server/**/*.js', () => {
		server_restart();
	});
});