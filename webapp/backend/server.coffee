# @file
# @author Katharine Cordes
# @date   1/21/16
# @brief  Configure the server and start it.

# Module dependencies.
express  = require 'express'
fs       = require 'fs'
join     = require('path').join
Promise  = require 'bluebird'

config   = require './config/config'

# Create the server
app = express()
port = process.env.PORT or 3000

# Bootstrap the application settings.
require('./config/express')(app)

# Bootstrap the models and store them in the server app.
#models = {}
#for file in fs.readdirSync(join(__dirname, 'models'))
#	if file.indexOf('.coffee') isnt -1
#		model = require(join(__dirname, 'models', file))(app)
#		if not model.noPromisify
#			Promise.promisifyAll model.instance
#		
#		models[model.name] = model.instance
#app.set 'models', models

#Bootstrap the models.
require('./config/models')(app)

# Bootstrap the routes.
require('./config/routes')(app)

# Start the server.
app.listen port
console.log 'Express app started on ' + port

# Expose the module.
module.exports = app