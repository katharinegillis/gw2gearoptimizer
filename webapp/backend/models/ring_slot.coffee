# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a ring slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class RingSlot extends Slot
		constructor: (selected_stat_combos, stat_data) ->
			available_stat_combos = StatCombinations.getRingAvailableStatCombinations selected_stat_combos

			super available_stat_combos, stat_data

		getStats: ->
			list = @getStatList()
			stats = {}
			if list.hasOwnProperty('major') and list.major.length is 1
				stats[list.major[0]] = 126
				stats[list.minor[0]] = 85
				stats[list.minor[1]] = 85
			else if not list.hasOwnProperty('major')
				stats[stat] = 57 for stat in list.minor
			
			stats

	RingSlot

module.exports = modelFactory