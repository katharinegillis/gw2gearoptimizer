# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Handles the client-requested actions for the Optimization Form.

AppDispatcher                 = require '../dispatcher/AppDispatcher.coffee'
OptimizationFormConstants     = require '../constants/OptimizationFormConstants.coffee'
CalculationAPI                = require '../api/CalculationAPI.coffee'
Promise                       = require 'bluebird'
OptimizationFormServerActions = require './OptimizationFormServerActions.coffee'

Promise.promisifyAll CalculationAPI

OptimizationFormActions =
	optimize: (params) ->
		AppDispatcher.dispatch action_type: OptimizationFormConstants.OPTIMIZE
		CalculationAPI.calculateAsync params
			.then (result) ->
				OptimizationFormServerActions.receiveOptimizeResult result
			.catch (error) ->
				console.log error

module.exports = OptimizationFormActions