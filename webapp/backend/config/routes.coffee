# @file
# @author Katharine Cordes
# @date   1/21/16
# @brief  Configure the routes.

# Module dependencies.
express_winston = require 'express-winston'

routes_config = (app) ->
	# Bootstrap the controllers.
	index = require('../controllers/index')(app)
	calculate = require('../controllers/calculate')(app)
	
	# Main routes.
	app.get '/', index.index

	# API routes.
	app.post '/api/calculate', calculate.index

	# Error routes.
	app.use express_winston.errorLogger(winstonInstance: app.get('logger'))

	app.use (err, req, res, next) ->
		if err.message and err.message.indexOf('not found') isnt -1 and err.message.indexOf('Cast to ObjectId failed')
			return next()

		app.get 'logger'
			.error 'Error: ' + JSON.stringify(err)

		# Show the error page.
		data = {}
		if app.get('env') is 'development'
			data.error = err.stack

		res.status 500
			.render '500', data

	app.use (req, res, next) ->
		res.status 404
			.render '404', 
				url: req.originalUrl
				error: 'Not found'

# Expose the module.
module.exports = routes_config