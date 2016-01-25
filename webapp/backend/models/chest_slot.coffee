# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a chest slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class ChestSlot extends Slot
		constructor: (stat_combo) ->
			@available_stat_combos = StatCombinations.getArmourAvailableStatCombinations()

			super stat_combo

		getStats: ->
			list = @getStatList()
			stats = {}
			if list.hasOwnPropery('major') and list.major.length is 1
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

			stats

	ChestSlot

module.exports = modelFactory