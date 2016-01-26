# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a headgear slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class HeadgearSlot extends Slot
		constructor: (selected_stat_combos, stat_combo) ->
			available_stat_combos = StatCombinations.getArmourAvailableStatCombinations selected_stat_combos

			super available_stat_combos, stat_combo

		getStats: ->
			list = @getStatList()
			stats = {}
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

			stats

	HeadgearSlot

module.exports = modelFactory