# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a leggings slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class LeggingsSlot extends Slot
		constructor: (type, selected_stat_combos, stat_data) ->
			available_stat_combos = StatCombinations.getArmourAvailableStatCombinations selected_stat_combos

			super type, available_stat_combos, stat_data

		getStats: ->
			list = @getStatList()
			stats = {}
			if @type is 'ascended'
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 94
					stats[list.minor[0]] = 67
					stats[list.minor[1]] = 67
				else if not list.hasOwnProperty('major')
					stats[stat] = 44 for stat in list.minor
				else
					stats[list.major[0]] = 81
					stats[list.major[1]] = 81
					stats[list.minor[0]] = 44
					stats[list.minor[1]] = 44
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

	LeggingsSlot

module.exports = modelFactory