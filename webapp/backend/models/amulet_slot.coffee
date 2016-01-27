# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines an amulet slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class AmuletSlot extends Slot
		constructor: (selected_stat_combos, stat_data) ->
			available_stat_combos = StatCombinations.getAmuletAvailableStatCombinations selected_stat_combos

			super available_stat_combos, stat_data

		getStats: ->
			list = @getStatList()
			stats = {}
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

			stats

	AmuletSlot

module.exports = modelFactory