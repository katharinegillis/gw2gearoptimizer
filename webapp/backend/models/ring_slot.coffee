# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a ring slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class RingSlot extends Slot
		constructor: (selected_stat_combos, stat_combo) ->
			available_stat_combos = StatCombinations.getRingAvailableStatCombinations selected_stat_combos

			super available_stat_combos, stat_combo

	RingSlot

module.exports = modelFactory