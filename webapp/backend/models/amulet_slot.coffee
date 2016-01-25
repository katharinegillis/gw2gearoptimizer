# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines an amulet slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class AmuletSlot extends Slot
		constructor: (selected_stat_combos, stat_combo) ->
			available_stat_combos = StatCombinations.getAmuletAvailableStatCombinations selected_stat_combos

			super available_stat_combos, stat_combo

	AmuletSlot

module.exports = modelFactory