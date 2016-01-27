# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines an accessory slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class AccessorySlot extends Slot
		constructor: (selected_stat_combos, stat_data) ->
			available_stat_combos = StatCombinations.getAccessoryAvailableStatCombinations selected_stat_combos

			super available_stat_combos, stat_data

		getStats: ->
			list = @getStatList()
			stats = {}
			if list.hasOwnProperty('major') and list.major.length is 1
				stats[list.major[0]] = 110
				stats[list.minor[0]] = 74
				stats[list.minor[1]] = 74
			else if not list.hasOwnProperty('major')
				stats[stat] = 50 for stat in list.minor

			stats

	AccessorySlot

module.exports = modelFactory