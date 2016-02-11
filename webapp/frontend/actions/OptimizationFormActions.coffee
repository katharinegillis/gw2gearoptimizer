# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Handles the client-requested actions for the Optimization Form.

AppDispatcher             = require '../dispatcher/AppDispatcher.coffee'
OptimizationFormConstants = require '../constants/OptimizationFormConstants.coffee'
CalculationAPI            = require '../api/CalculationAPI.coffee'
ResultServerActions       = require './ResultServerActions.coffee'

OptimizationFormActions =
	optimize: (params) ->
		AppDispatcher.dispatch action_type: OptimizationFormConstants.OPTIMIZE
		CalculationAPI.calculate params, (error, result) ->
			if error isnt undefined and error isnt null and error isnt ''
				console.log error
				return

			ResultServerActions.receiveResult result

module.exports = OptimizationFormActions