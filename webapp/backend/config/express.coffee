# @file
# @author Katharine Cordes
# @date   1/21/16
# @brief  Configure the ExpressJS server.

# Module dependencies.
compression     = require 'compression'
winston         = require 'winston'
join            = require('path').join
body_parser     = require 'body-parser'
method_override = require 'method-override'
session         = require 'express-session'
express_winston = require 'express-winston'

config          = require './config'

# Configure the server.
express_config = (app) ->
	# Set up the compression middleare.
	app.use compression(threshold: 512)

	# Set up the logging.
	logger = new (winston.Logger)(config.logger)
	app.set 'logger', logger

	# Set up the views.
	app.set 'views', join(config.root, 'views')
	app.set 'view engine', 'jade'

	# Set up the request parsers.
	app.use body_parser.json()
	app.use body_parser.urlencoded(extended: true)
	app.use method_override((req, res) ->
		if req.body and typeof req.body is 'object' and '_method' in req.body
			# Look in the urlencoded POST bodies and delete the method.
			method = req.body._method
			delete req.body._method
			method
	)

	# Set up the session parsers.
	app.use session(
		resave: false
		saveUninitialized: true
		secret: config.session.secret
	)

	# Set up access logging.
	app.use express_winston.logger(winstonInstance: logger)

# Expose the module.
module.exports = express_config