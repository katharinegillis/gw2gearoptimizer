# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a gear slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	class Slot
		constructor: (available_stat_combos, stat_combo) ->
			# If a stat combo isn't passed in or is invalid for the slot, pick a random one of the available ones.
			@available_stat_combos = available_stat_combos
			stat_combo = @available_stat_combos[Math.floor(Math.random() * (@available_stat_combos.length))] if stat_combo is null or stat_combo is '' or @available_stat_combos.indexOf(stat_combo) is -1
			@stat_combo = stat_combo

		getStatCombo: ->
			@stat_combo

		getStatList: ->
			StatCombinations.getStatList @stat_combo

		randomizeStatCombo: ->
			@stat_combo = @available_stat_combos[Math.floor(Math.random() * (@available_stat_combos.length))]

	Slot

module.exports = modelFactory