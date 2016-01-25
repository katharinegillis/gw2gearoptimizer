# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines an amulet slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class AmuletSlot extends Slot
		constructor: (stat_combo) ->
			@available_stat_combos = StatCombinations.getAmuletAvailableStatCombinations()

			super stat_combo

	AmuletSlot

module.exports = modelFactory