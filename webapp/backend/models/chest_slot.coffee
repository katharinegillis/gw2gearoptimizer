# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a chest slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class ChestSlot extends Slot
		constructor: (type, selected_stat_combos, stat_data) ->
			available_stat_combos = StatCombinations.getArmourAvailableStatCombinations selected_stat_combos

			super type, available_stat_combos, stat_data

		getStats: ->
			list = @getStatList()
			stats = {}
			if @type is 'ascended'
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 141
					stats[list.minor[0]] = 101
					stats[list.minor[1]] = 101
				else if not list.hasOwnProperty('major')
					stats[stat] = 67 for stat in list.minor
				else
					stats[list.major[0]] = 121
					stats[list.major[1]] = 121
					stats[list.minor[0]] = 67
					stats[list.minor[1]] = 67
			else
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 134
					stats[list.minor[0]] = 96
					stats[list.minor[1]] = 96
				else if not list.hasOwnProperty('major')
					stats[stat] = 63 for stat in list.minor
				else
					stats[list.major[0]] = 115
					stats[list.major[1]] = 115
					stats[list.minor[0]] = 63
					stats[list.minor[1]] = 63

			stats

	ChestSlot

module.exports = modelFactory