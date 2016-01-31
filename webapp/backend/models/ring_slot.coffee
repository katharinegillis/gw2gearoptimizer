# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a ring slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class RingSlot extends Slot
		constructor: (type, selected_stat_combos, stat_data) ->
			available_stat_combos = StatCombinations.getRingAvailableStatCombinations selected_stat_combos

			super type, available_stat_combos, stat_data

		getStats: ->
			list = @getStatList()
			stats = {}
			if @type is 'ascended'
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 126
					stats[list.minor[0]] = 85
					stats[list.minor[1]] = 85
				else if not list.hasOwnProperty('major')
					stats[stat] = 57 for stat in list.minor
			else
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 90
					stats[list.minor[0]] = 64
					stats[list.minor[1]] = 64
				else if not list.hasOwnProperty('major')
					stats[stat] = 42 for stat in list.minor
				else
					stats[list.major[0]] = 77
					stats[list.major[1]] = 77
					stats[list.minor[0]] = 42
					stats[list.minor[1]] = 42
			
			stats

	RingSlot

module.exports = modelFactory