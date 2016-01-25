# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a back slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class BackSlot extends Slot
		constructor: (stat_combo) ->
			@available_stat_combos = StatCombinations.getBackAvailableStatCombinations()

			super stat_combo

	BackSlot

module.exports = modelFactory