# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Handles the interaction between the server and the client for data.

Request = require 'request'
Url     = require 'url'

module.exports =
	calculate: (params, callback) ->
		Request.post
			url: Url.resolve process.env.BASE_URL, '/api/calculate'
			json: params
		, (error, response, body) ->
			if not error and response.statusCode is 200
				callback null, body
			else
				if not error
					error =
						statusCode: response.statusCode
						body: body

				callback error, null