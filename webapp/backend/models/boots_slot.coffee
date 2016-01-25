# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a boots slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class BootsSlot extends Slot
		constructor: (selected_stat_combos, stat_combo) ->
			available_stat_combos = StatCombinations.getArmourAvailableStatCombinations selected_stat_combos

			super available_stat_combos, stat_combo

		getStats: ->
			list = @getStatList()
			stats = {}
			if list.hasOwnPropery('major') and list.major.length is 1
				stats[list.major[0]] = 47
				stats[list.minor[0]] = 34
				stats[list.minor[1]] = 34
			else if not list.hasOwnProperty('major')
				stats[stat] = 22 for stat in list.minor
			else
				stats[list.major[0]] = 40
				stats[list.major[1]] = 40
				stats[list.minor[0]] = 22
				stats[list.minor[1]] = 22

			stats

	BootsSlot

module.exports = modelFactory