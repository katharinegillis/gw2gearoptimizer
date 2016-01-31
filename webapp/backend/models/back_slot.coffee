# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a back slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class BackSlot extends Slot
		constructor: (type, selected_stat_combos, stat_data) ->
			available_stat_combos = StatCombinations.getBackAvailableStatCombinations selected_stat_combos

			super type, available_stat_combos, stat_data

		getStats: ->
			list = @getStatList()
			stats = {}
			if @type is 'ascended'
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 63
					stats[list.minor[0]] = 40
					stats[list.minor[1]] = 40
			else
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 32
					stats[list.minor[0]] = 18
					stats[list.minor[1]] = 18
				else if not list.hasOwnProperty('major')
					stats[stat] = 13 for stat in list.minor

			stats

	BackSlot

module.exports = modelFactory