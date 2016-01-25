# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a weapon slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class TwoHandWeaponSlot extends Slot
		constructor: (stat_combo) ->
			@available_stat_combos = StatCombinations.getWeaponAvailableStatCombinations()

			super stat_combo

		getStats: ->
			list = @getStatList()
			stats = {}
			if list.hasOwnPropery('major') and list.major.length is 1
				stats[list.major[0]] = 251
				stats[list.minor[0]] = 179
				stats[list.minor[1]] = 179
			else if not list.hasOwnProperty('major')
				stats[stat] = 118 for stat in list.minor
			else
				stats[list.major[0]] = 215
				stats[list.major[1]] = 215
				stats[list.minor[0]] = 118
				stats[list.minor[1]] = 118

			stats

	TwoHandWeaponSlot

module.exports = modelFactory