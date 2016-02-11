# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Handles the server-requested actions for the Optimization Form store.

AppDispatcher   = require '../dispatcher/AppDispatcher.coffee'
ResultConstants = require '../constants/ResultConstants.coffee'

ResultServerActions =
	receiveResult: (result) ->
		AppDispatcher.dispatch
			action_type: ResultConstants.RECEIVE_RESULT
			data: result

module.exports = ResultServerActions