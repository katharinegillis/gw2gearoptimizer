# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a back slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class BackSlot extends Slot
		constructor: (selected_stat_combos, stat_combo) ->
			available_stat_combos = StatCombinations.getBackAvailableStatCombinations selected_stat_combos

			super available_stat_combos, stat_combo

		getStats: ->
			list = @getStatList()
			stats = {}
			if list.hasOwnProperty('major') and list.major.length is 1
				stats[list.major[0]] = 63
				stats[list.minor[0]] = 40
				stats[list.minor[1]] = 40

			stats

	BackSlot

module.exports = modelFactory