# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a ring slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class RingSlot extends Slot
		constructor: (stat_combo) ->
			@available_stat_combos = StatCombinations.getRingAvailableStatCombinations()

			super stat_combo

	RingSlot

module.exports = modelFactory