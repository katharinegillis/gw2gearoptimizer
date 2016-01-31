# @file
# @author Katharine Cordes
# @date   1/30/16
# @brief  Defines the production server configuration.

winston = require 'winston'

# Set up the production config.
config =
	base_url: process.env.BASE_URL
	logger:
		transports: [
			new winston.transports.File
				filename: 'logs/error.log'
				level: 'error'
				name: 'prod-error-file'
				prettyPrint: true
				maxSize: 10*1024*1024
				maxFiles: 5
			new winston.transports.File
				filename: 'logs/system.log'
				level: 'warn'
				name: 'prod-system-file'
				prettyPrint: true
				maxSize: 10*1024*1024
				maxFiles: 5
		]

module.exports = config
