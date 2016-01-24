# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Handles the optimization form data.

AppDispatcher             = require '../dispatcher/AppDispatcher.coffee'
EventEmitter              = require('events').EventEmitter
assign                    = require 'object-assign'
OptimizationFormConstants = require '../constants/OptimizationFormConstants.coffee'

_data =
	result: {}

CHANGE_EVENT = 'change'

OptimizationFormStore = assign {}, EventEmitter.prototype,
	getResult: ->
		_data.result

	emitChange: ->
		@emit CHANGE_EVENT

	addChangeListener: (callback) ->
		@on CHANGE_EVENT, callback

	removeChangeListener: (callback) ->
		@removeListener CHANGE_EVENT, callback

AppDispatcher.register (action) ->
	switch action.action_type
		when OptimizationFormConstants.RECEIVE_OPTIMIZE_RESULT
			_data.result = action.data
			OptimizationFormStore.emitChange()

module.exports = OptimizationFormStore