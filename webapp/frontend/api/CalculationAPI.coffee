# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Handles the interaction between the server and the client for data.

$   = require 'jquery'

module.exports =
	calculate: (params, callback) ->
		$.ajax {
			url: process.env.BASE_URL + '/api/calculate'
			data: JSON.stringify params
			type: 'POST'
			contentType: 'application/json'
			dataType: 'json'
		}
			.done (result) ->
				callback null, result
			.fail (error) ->
				callback error, null