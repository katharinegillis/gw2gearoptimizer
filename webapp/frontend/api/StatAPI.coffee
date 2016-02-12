# @file
# @author Katharine Cordes
# @date   2/11/16
# @brief  Handles the interaction between the server and the client for data.

$   = require 'jquery'

module.exports =
	availableCombos: (callback) ->
		$.ajax {
			url: process.env.BASE_URL + '/api/slot/availableCombos'
			type: 'GET'
			contentType: 'application/json'
			dataType: 'json'
		}
			.done (result) ->
				callback null, result
			.fail (error) ->
				callback error, null