# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Stores information about the stat combinations.

_ = require 'underscore'

class StatCombinations
	constructor: (selected_stat_combos) ->
		@selected_stat_combos = selected_stat_combos
		@selected_armour_stat_combos = null
		@selected_weapon_stat_combos = null
		@selected_amulet_stat_combos = null
		@selected_ring_stat_combos = null
		@selected_accessory_stat_combos = null
		@selected_back_stat_combos = null

	getArmourAvailableStatCombinations: () ->
		if @selected_armour_stat_combos is null
			all_armour_stat_combos = [
				'berserker'
				'zealot'
				'soldier'
				'valkyrie'
				'rampager'
				'assassin'
				'knight'
				'cavalier'
				'nomad'
				'settler'
				'sentinel'
				'shaman'
				'sinister'
				'carrion'
				'rabid'
				'dire'
				'cleric'
				'magi'
				'apothecary'
				'commander'
				'marauder'
				'vigilant'
				'crusader'
				'wanderer'
				'viper'
				'trailblazer'
				'minstrel'
			]
			@selected_armour_stat_combos = _.intersection(all_armour_stat_combos, @selected_stat_combos)

		@selected_armour_stat_combos

	getWeaponAvailableStatCombinations: () ->
		if @selected_weapon_stat_combos is null
			all_weapon_stat_combos = [
				'berserker'
				'zealot'
				'soldier'
				'valkyrie'
				'rampager'
				'assassin'
				'knight'
				'cavalier'
				'nomad'
				'settler'
				'sentinel'
				'shaman'
				'sinister'
				'carrion'
				'rabid'
				'dire'
				'cleric'
				'magi'
				'apothecary'
				'commander'
				'marauder'
				'vigilant'
				'crusader'
				'wanderer'
				'viper'
				'trailblazer'
				'minstrel'
			]
			@selected_weapon_stat_combos = _.intersection(all_weapon_stat_combos, @selected_stat_combos)

		@selected_weapon_stat_combos

	getAmuletAvailableStatCombinations: () ->
		if @selected_jewelery_stat_combos is null
			all_amulet_stat_combos = [
				'berserker'
				'soldier'
				'captain'
				'rampager'
				'knight'
				'cavalier'
				'rabid'
				'sinister'
				'cleric'
				'apothecary'
				'nomad'
				'celestial'
				'marauder'
				'crusader'
			]
			@selected_amulet_stat_combos = _.intersection(all_amulet_stat_combos, @selected_stat_combos)

		@selected_amulet_stat_combos

	getRingAvailableStatCombinations: () ->
		if @selected_ring_stat_combos is null
			all_ring_stat_combos = [
				'berserker'
				'soldier'
				'captain'
				'rampager'
				'knight'
				'cavalier'
				'nomads'
				'rabid'
				'cleric'
				'apothecary'
				'celestial'
			]
			@selected_ring_stat_combos = _.intersection(all_ring_stat_combos, @selected_stat_combos)

		@selected_ring_stat_combos

	getAccessoryAvailableStatCombinations: () ->
		if @selected_accessory_stat_combos is null
			all_accessory_stat_combos = [
				'berserker'
				'soldier'
				'captain'
				'rampager'
				'assassin'
				'knight'
				'cavalier'
				'nomad'
				'sentinel'
				'rabid'
				'carrion'
				'sinister'
				'cleric'
				'magi'
				'apothecary'
				'celestial'
			]
			@selected_accessory_stat_combos = _.intersection(all_accessory_stat_combos, @selected_stat_combos)

		@selected_accessory_stat_combos

	getBackAvailableStatCombinations: () ->
		if @selected_back_stat_combos is null
			all_back_stat_combos = [
				'berserker'
				'soldier'
				'cavalier'
				'rabid'
				'apothecary'
			]
			@selected_back_stat_combos = _.intersection(all_back_stat_combos, @selected_stat_combos)

		@selected_back_stat_combos

	mergeStats: (stats1, stats2) ->
		for stat, value in stats2
			if stats1.hasOwnProperty stat then stats1[stat] += value else stats1[stat] = value

		stats1

	getStatList: (stat_combo) ->
		switch stat_combo
			when 'berserker'
				major: ['power']
				minor: ['precision', 'ferocity']
			when 'soldier'
				major: ['power']
				minor: ['toughness', 'vitality']
			when 'valkyrie'
				major: ['power']
				minor: ['vitality', 'ferocity']
			when 'zealot'
				major: ['power']
				minor: ['precision', 'healing power']
			when 'assassin'
				major: ['precision']
				minor: ['power', 'ferocity']
			when 'rampager'
				major: ['precision']
				minor: ['power', 'condition damage']
			when 'cavalier'
				major: ['toughness']
				minor: ['power', 'ferocity']
			when 'knight'
				major: ['toughness']
				minor: ['power', 'ferocity']
			when 'nomad'
				major: ['toughness']
				minor: ['vitality', 'healing power']
			when 'settler'
				major: ['toughness']
				minor: ['condition damage', 'healing power']
			when 'sentinel'
				major: ['vitality']
				minor: ['power', 'toughness']
			when 'shaman'
				major: ['vitality']
				minor: ['condition damage', 'healing power']
			when 'carrion'
				major: ['condition damage']
				minor: ['power', 'vitality']
			when 'dire'
				major: ['condition damage']
				minor: ['toughness', 'vitality']
			when 'rabid'
				major: ['condition damage']
				minor: ['precision', 'toughness']
			when 'sinister'
				major: ['condition damage']
				minor: ['power', 'precision']
			when 'apothecary'
				major: ['healing power']
				minor: ['toughness', 'condition damage']
			when 'cleric'
				major: ['healing power']
				minor: ['power', 'toughness']
			when 'magi'
				major: ['healing power']
				minor: ['precision', 'vitality']
			when 'celestial'
				minor: ['power', 'precision', 'toughness', 'vitality', 'condition damage', 'ferocity', 'healing power']
			when 'commander'
				major: ['power', 'precision']
				minor: ['toughness', 'concentration']
			when 'marauder'
				major: ['power', 'precision']
				minor: ['vitality', 'ferocity']
			when 'vigilant'
				major: ['power', 'toughness']
				minor: ['concentration', 'expertise']
			when 'crusader'
				major: ['power', 'toughness']
				minor: ['ferocity', 'healing power']
			when 'wanderer'
				major: ['power', 'vitality']
				minor: ['toughness', 'concentration']
			when 'viper'
				major: ['power', 'condition damage']
				minor: ['precision', 'expertise']
			when 'trailblazer'
				major: ['toughness', 'condition damage']
				minor: ['vitality', 'expertise']
			when 'minstrel'
				major: ['toughness', 'healing power']
				minor: ['vitality', 'concentration']
			when 'captain'
				major: ['precision']
				minor: ['power', 'toughness']

module.exports = StatCombinations