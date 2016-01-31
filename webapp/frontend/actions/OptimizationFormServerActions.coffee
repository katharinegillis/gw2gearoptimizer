# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Handles the server-requested actions for the Optimization Form store.

AppDispatcher             = require '../dispatcher/AppDispatcher.coffee'
OptimizationFormConstants = require '../constants/OptimizationFormConstants.coffee'

OptimizationFormServerActions =
	receiveOptimizeResult: (result) ->
		AppDispatcher.dispatch
			action_type: OptimizationFormConstants.RECEIVE_OPTIMIZE_RESULT
			data: result

module.exports = OptimizationFormServerActions