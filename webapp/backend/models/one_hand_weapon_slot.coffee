# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a weapon slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class OneHandWeaponSlot extends Slot
		constructor: (type, selected_stat_combos, stat_data) ->
			available_stat_combos = StatCombinations.getWeaponAvailableStatCombinations selected_stat_combos

			super type, available_stat_combos, stat_data

		getStats: ->
			list = @getStatList()
			stats = {}
			if @type is 'ascended'
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 125
					stats[list.minor[0]] = 90
					stats[list.minor[1]] = 90
				else if not list.hasOwnProperty('major')
					stats[stat] = 59 for stat in list.minor
				else
					stats[list.major[0]] = 108
					stats[list.major[1]] = 108
					stats[list.minor[0]] = 59
					stats[list.minor[1]] = 59
			else
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 120
					stats[list.minor[0]] = 85
					stats[list.minor[1]] = 85
				else if not list.hasOwnProperty('major')
					stats[stat] = 56 for stat in list.minor
				else
					stats[list.major[0]] = 102
					stats[list.major[1]] = 102
					stats[list.minor[0]] = 56
					stats[list.minor[1]] = 56

			stats

	OneHandWeaponSlot

module.exports = modelFactory