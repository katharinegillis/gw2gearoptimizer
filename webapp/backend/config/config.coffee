# @file
# @author Katharine Cordes
# @date   1/21/16
# @brief  Defines the server configuration.

# Module dependencies.
join    = require('path').join
winston = require 'winston'
extend  = require 'extend'

# Get the environment configuration based on the defined environment.
env = process.env.NODE_ENV or 'development'
env_config   = require './env/' + env

# Set up the default (development) config.
defaults =
	root: join __dirname, '..'
	base_url: 'http://localdev.gw2gearopt.tichi.org'
	logger:
		transports: [
			new winston.transports.Console colorize: true, level: 'debug'
			new winston.transports.File
				filename: 'logs/error.log'
				level: 'error'
				name: 'error-file'
				json: false
			new winston.transports.File
				filename: 'logs/system.log'
				level: 'warn'
				name: 'system-file'
				json: false
		]
	cookie:
		secret: process.env.COOKIE_SECRET
	session:
		secret: process.env.SESSION_SECRET
	db:
		name: 'mongodb://localhost/wishlist_dev'
		options: {}

config = extend true, defaults, env_config

# Expose the module.
module.exports = config