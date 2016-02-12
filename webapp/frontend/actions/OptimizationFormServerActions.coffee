# @file
# @author Katharine Cordes
# @date   2/11/16
# @brief  Handles the server-requested actions for the Optimization Form store.

AppDispatcher   = require '../dispatcher/AppDispatcher.coffee'
OptimizationFormConstants = require '../constants/OptimizationFormConstants.coffee'

OptimizationFormServerActions =
	receiveOptions: (result) ->
		AppDispatcher.dispatch
			action_type: OptimizationFormConstants.RECEIVE_OPTIONS
			data: result

module.exports = OptimizationFormServerActions