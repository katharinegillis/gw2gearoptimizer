# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a gear slot.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	class Slot
		constructor: (available_stat_combos, stat_data) ->
			available_stat_combos.sort()
			@available_stat_combos = available_stat_combos
			stat_data = Math.floor Math.random() * @available_stat_combos.length if stat_data is null or stat_data is undefined or stat_data >= @available_stat_combos.length
			@stat_data = stat_data
			if @available_stat_combos.length < 2
				@stat_data_length = 1
			else if @available_stat_combos.length < 4
				@stat_data_length = 2
			else if @available_stat_combos.length < 8
				@stat_data_length = 3
			else if @available_stat_combos.length < 16
				@stat_data_length = 4
			else if @available_stat_combos.length < 32
				@stat_data_length = 5
			else
				@stat_data_length = 6

		getStatComboName: ->
			@available_stat_combos[@stat_data]

		getStatList: ->
			StatCombinations.getStatList @available_stat_combos[@stat_data]

		randomizeStatCombo: ->
			@stat_data = Math.floor Math.random() * @available_stat_combos.length

		isValid: (stat_data) ->
			stat_data = @stat_data if stat_data is null or stat_data is undefined
			stat_data < @available_stat_combos.length

		getStatData: ->
			@stat_data

		getStatDataLength: ->
			@stat_data_length

		getStatDataMask: ->
			switch @stat_data_length
				when 1 then return 1
				when 2 then return 3
				when 3 then return 7
				when 4 then return 15
				when 5 then return 31
				when 6 then return 63

		setStatData: (stat_data) ->
			stat_data = Math.floor Math.random() * @available_stat_combos.length if stat_data >= @available_stat_combos.length
			@stat_data = stat_data

	Slot

module.exports = modelFactory