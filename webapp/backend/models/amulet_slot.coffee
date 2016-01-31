# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines an amulet slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class AmuletSlot extends Slot
		constructor: (type, selected_stat_combos, stat_data) ->
			available_stat_combos = StatCombinations.getAmuletAvailableStatCombinations selected_stat_combos

			super type, available_stat_combos, stat_data

		getStats: ->
			list = @getStatList()
			stats = {}
			if @type is 'ascended'
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 157
					stats[list.minor[0]] = 108
					stats[list.minor[1]] = 108
				else if not list.hasOwnProperty('major')
					stats[stat] = 72 for stat in list.minor
				else
					stats[list.major[0]] = 133
					stats[list.major[1]] = 133
					stats[list.minor[0]] = 71
					stats[list.minor[1]] = 71
			else
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 120
					stats[list.minor[0]] = 85
					stats[list.minor[1]] = 85
				else if not list.hasOwnProperty('major')
					stats[stat] = 56 for stat in list.minor
				else
					stats[list.major[0]] = 102
					stats[list.major[1]] = 102
					stats[list.minor[0]] = 56
					stats[list.minor[1]] = 56

			stats

	AmuletSlot

module.exports = modelFactory