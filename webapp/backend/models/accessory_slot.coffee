# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines an accessory slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class AccessorySlot extends Slot
		constructor: (stat_combo) ->
			@available_stat_combos = StatCombinations.getAccessoryAvailableStatCombinations()

			super stat_combo

	AccessorySlot

module.exports = modelFactory