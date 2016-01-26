# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a weapon slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class OneHandWeaponSlot extends Slot
		constructor: (selected_stat_combos, stat_combo) ->
			available_stat_combos = StatCombinations.getWeaponAvailableStatCombinations selected_stat_combos

			super available_stat_combos, stat_combo

		getStats: ->
			list = @getStatList()
			stats = {}
			if list.hasOwnProperty('major') and list.major.length is 1
				stats[list.major[0]] = 125
				stats[list.minor[0]] = 90
				stats[list.minor[1]] = 90
			else if not list.hasOwnProperty('major')
				stats[stat] = 59 for stat in list.minor
			else
				stats[list.major[0]] = 108
				stats[list.major[1]] = 108
				stats[list.minor[0]] = 59
				stats[list.minor[1]] = 59

			stats

	OneHandWeaponSlot

module.exports = modelFactory