# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a gloves slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class GlovesSlot extends Slot
		constructor: (type, selected_stat_combos, stat_data) ->
			available_stat_combos = StatCombinations.getArmourAvailableStatCombinations selected_stat_combos

			super type, available_stat_combos, stat_data

		getStats: ->
			list = @getStatList()
			stats = {}
			if @type is 'ascended'
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 47
					stats[list.minor[0]] = 34
					stats[list.minor[1]] = 34
				else if not list.hasOwnProperty('major')
					stats[stat] = 22 for stat in list.minor
				else
					stats[list.major[0]] = 40
					stats[list.major[1]] = 40
					stats[list.minor[0]] = 22
					stats[list.minor[1]] = 22
			else
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 45
					stats[list.minor[0]] = 32
					stats[list.minor[1]] = 32
				else if not list.hasOwnProperty('major')
					stats[stat] = 21 for stat in list.minor
				else
					stats[list.major[0]] = 38
					stats[list.major[1]] = 38
					stats[list.minor[0]] = 21
					stats[list.minor[1]] = 21

			stats

	GlovesSlot

module.exports = modelFactory