# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a weapon slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	Slot = models.Slot

	class TwoHandWeaponSlot extends Slot
		constructor: (type, selected_stat_combos, stat_data) ->
			available_stat_combos = StatCombinations.getWeaponAvailableStatCombinations selected_stat_combos

			super type, available_stat_combos, stat_data

		getStats: ->
			list = @getStatList()
			stats = {}
			if @type is 'ascended'
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 251
					stats[list.minor[0]] = 179
					stats[list.minor[1]] = 179
				else if not list.hasOwnProperty('major')
					stats[stat] = 118 for stat in list.minor
				else
					stats[list.major[0]] = 215
					stats[list.major[1]] = 215
					stats[list.minor[0]] = 118
					stats[list.minor[1]] = 118
			else
				if list.hasOwnProperty('major') and list.major.length is 1
					stats[list.major[0]] = 239
					stats[list.minor[0]] = 171
					stats[list.minor[1]] = 171
				else if not list.hasOwnProperty('major')
					stats[stat] = 113 for stat in list.minor
				else
					stats[list.major[0]] = 205
					stats[list.major[1]] = 205
					stats[list.minor[0]] = 113
					stats[list.minor[1]] = 113

			stats

	TwoHandWeaponSlot

module.exports = modelFactory