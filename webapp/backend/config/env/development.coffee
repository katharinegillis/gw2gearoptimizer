# @file
# @author Katharine Cordes
# @date   1/21/16
# @brief  Development environment configuration.

# Module dependencies.
join = require('path').join
fs   = require 'fs'

# Adjust the environment variables based on values in the env.json file (unsecure, only done for development).
env     = {}
env_file = join __dirname, 'env.json'

if fs.existsSync env_file
	env = fs.readFileSync env_file, 'utf-8'
	env = JSON.parse env
	for key, value of env
		process.env[key] = value

config = {}

# Expose the module.
module.exports = config