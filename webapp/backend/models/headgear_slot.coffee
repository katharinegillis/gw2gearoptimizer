# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a headgear slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class HeadgearSlot extends Slot
		constructor: (type, selected_stat_combos, stat_data) ->
			available_stat_combos = StatCombinations.getArmourAvailableStatCombinations selected_stat_combos

			super type, available_stat_combos, stat_data

		getStats: ->
			list = @getStatList()
			stats = {}
			if @type is 'ascended'
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 63
					stats[list.minor[0]] = 45
					stats[list.minor[1]] = 45
				else if not list.hasOwnProperty('major')
					stats[stat] = 30 for stat in list.minor
				else
					stats[list.major[0]] = 54
					stats[list.major[1]] = 54
					stats[list.minor[0]] = 30
					stats[list.minor[1]] = 30
			else
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 60
					stats[list.minor[0]] = 43
					stats[list.minor[1]] = 43
				else if not list.hasOwnProperty('major')
					stats[stat] = 28 for stat in list.minor
				else
					stats[list.major[0]] = 51
					stats[list.major[1]] = 51
					stats[list.minor[0]] = 28
					stats[list.minor[1]] = 28

			stats

	HeadgearSlot

module.exports = modelFactory