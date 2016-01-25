# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a gloves slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class GlovesSlot extends Slot
		constructor: (stat_combo) ->
			@available_stat_combos = StatCombinations.getArmourAvailableStatCombinations()

			super stat_combo

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

	GlovesSlot

module.exports = modelFactory