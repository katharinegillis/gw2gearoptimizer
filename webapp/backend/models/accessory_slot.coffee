# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines an accessory slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class AccessorySlot extends Slot
		constructor: (type, selected_stat_combos, stat_data) ->
			available_stat_combos = StatCombinations.getAccessoryAvailableStatCombinations selected_stat_combos

			super type, available_stat_combos, stat_data

		getStats: ->
			list = @getStatList()
			stats = {}
			if @type is 'ascended'
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 110
					stats[list.minor[0]] = 74
					stats[list.minor[1]] = 74
				else if not list.hasOwnProperty('major')
					stats[stat] = 50 for stat in list.minor
			else
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 75
					stats[list.minor[0]] = 53
					stats[list.minor[1]] = 53
				else if not list.hasOwnProperty('major')
					stats[stat] = 35 for stat in list.minor
				else
					stats[list.major[0]] = 64
					stats[list.major[1]] = 64
					stats[list.minor[0]] = 35
					stats[list.minor[1]] = 35

			stats

	AccessorySlot

module.exports = modelFactory