# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Handles the client-requested actions for the Optimization Form.

AppDispatcher                 = require '../dispatcher/AppDispatcher.coffee'
OptimizationFormConstants     = require '../constants/OptimizationFormConstants.coffee'
CalculationAPI                = require '../api/CalculationAPI.coffee'
ResultServerActions           = require './ResultServerActions.coffee'
OptimizationFormServerActions = require './OptimizationFormServerActions.coffee'
StatAPI                       = require '../api/StatAPI.coffee'

OptimizationFormActions =
	optimize: (params) ->
		AppDispatcher.dispatch action_type: OptimizationFormConstants.OPTIMIZE
		CalculationAPI.calculate params, (error, result) ->
			if error isnt undefined and error isnt null and error isnt ''
				console.log error
				return

			ResultServerActions.receiveResult result

	getOptions: () ->
		AppDispatcher.dispatch action_type: OptimizationFormConstants.GET_OPTIONS
		StatAPI.availableCombos (error, result) ->
			if error isnt undefined and error isnt null and error isnt ''
				console.log error
				return

			OptimizationFormServerActions.receiveOptions result

	narrowOptions: (gear_level, selected_options) ->
		console.log 'narrowOptions'
		AppDispatcher.dispatch
			action_type: OptimizationFormConstants.NARROW_OPTIONS
			gear_level: gear_level
			selected_options: selected_options

module.exports = OptimizationFormActions