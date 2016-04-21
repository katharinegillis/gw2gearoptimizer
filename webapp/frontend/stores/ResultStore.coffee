# @file
# @author Katharine Cordes
# @date   2/11/16
# @brief  Handles the result data.

AppDispatcher   = require '../dispatcher/AppDispatcher.coffee'
EventEmitter    = require('events').EventEmitter
assign          = require 'object-assign'
ResultConstants = require '../constants/ResultConstants.coffee'

_data =
	result: {}

CHANGE_EVENT = 'change'

ResultStore = assign {}, EventEmitter.prototype,
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
		when ResultConstants.RECEIVE_RESULT
			_data.result = action.data
			ResultStore.emitChange()

module.exports = ResultStore