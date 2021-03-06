# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Stores information about the stat combinations.

_ = require 'underscore'

StatCombinations =
	getArmourAvailableStatCombinations: (selected_stat_combos) ->
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
		_.intersection(all_armour_stat_combos, selected_stat_combos)

	getWeaponAvailableStatCombinations: (selected_stat_combos) ->
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
		_.intersection(all_weapon_stat_combos, selected_stat_combos)

	getAmuletAvailableStatCombinations: (selected_stat_combos) ->
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
		_.intersection(all_amulet_stat_combos, selected_stat_combos)

	getRingAvailableStatCombinations: (selected_stat_combos) ->
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
		_.intersection(all_ring_stat_combos, selected_stat_combos)

	getAccessoryAvailableStatCombinations: (selected_stat_combos) ->
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
		_.intersection(all_accessory_stat_combos, selected_stat_combos)

	getBackAvailableStatCombinations: (selected_stat_combos) ->
		all_back_stat_combos = [
			'berserker'
			'soldier'
			'cavalier'
			'rabid'
			'apothecary'
		]
		_.intersection(all_back_stat_combos, selected_stat_combos)

	getArmourAvailableExoticStatCombinations: (selected_stat_combos) ->
		all_armour_stat_combos = [
			'berserker'
			'zealot'
			'soldier'
			'valkyrie'
			'assassin'
			'rampager'
			'knight'
			'cavalier'
			'settler'
			'giver'
			'sentinel'
			'shaman'
			'carrion'
			'rabid'
			'dire'
			'sinister'
			'cleric'
			'magi'
			'apothecary'
			'celestial'
			'marauder'
			'commander'
			'vigilant'
			'crusader'
			'wanderer'
			'viper'
			'trailblazer'
			'minstrel'
		]
		_.intersection all_armour_stat_combos, selected_stat_combos

	getWeaponAvailableExoticStatCombinations: (selected_stat_combos) ->
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
			'celestial'
			'marauder'
			'commander'
			'vigilant'
			'crusader'
			'wanderer'
			'viper'
			'trailblazer'
			'minstrel'
		]
		_.intersection all_weapon_stat_combos, selected_stat_combos

	getBackAvailableExoticStatCombinations: (selected_stat_combos) ->
		all_back_stat_combos = [
			'berserker'
			'soldier'
			'cavalier'
			'rabid'
			'magi',
			'apothecary'
			'captain'
			'celestial'
			'cleric'
			'knight'
			'rampager'
		]
		_.intersection all_back_stat_combos, selected_stat_combos

	getAmuletAvailableExoticStatCombinations: (selected_stat_combos) ->
		all_amulet_stat_combos = [
			'berserker'
			'zealot'
			'soldier'
			'valkyrie'
			'captain'
			'rampager'
			'assassin'
			'knight'
			'cavalier'
			'nomad'
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
			'celestial'
		]
		_.intersection all_amulet_stat_combos, selected_stat_combos

	getRingAvailableExoticStatCombinations: (selected_stat_combos) ->
		all_ring_stat_combos = [
			'berserker'
			'zealot'
			'soldier'
			'valkyrie'
			'captain'
			'rampager'
			'assassin'
			'knight'
			'cavalier'
			'nomad'
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
			'celestial'
		]
		_.intersection all_ring_stat_combos, selected_stat_combos

	getAccessoryAvailableExoticStatCombinations: (selected_stat_combos) ->
		all_accessory_stat_combos = [
			'berserker'
			'zealot'
			'soldier'
			'valkyrie'
			'captain'
			'rampager'
			'assassin'
			'knight'
			'cavalier'
			'nomad'
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
			'celestial'
		]
		_.intersection all_accessory_stat_combos, selected_stat_combos

	mergeStats: (stats1, stats2) ->
		for stat, value of stats2
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
				minor: ['precision', 'healing_power']
			when 'assassin'
				major: ['precision']
				minor: ['power', 'ferocity']
			when 'rampager'
				major: ['precision']
				minor: ['power', 'condition_damage']
			when 'cavalier'
				major: ['toughness']
				minor: ['power', 'ferocity']
			when 'knight'
				major: ['toughness']
				minor: ['power', 'ferocity']
			when 'nomad'
				major: ['toughness']
				minor: ['vitality', 'healing_power']
			when 'settler'
				major: ['toughness']
				minor: ['condition_damage', 'healing_power']
			when 'sentinel'
				major: ['vitality']
				minor: ['power', 'toughness']
			when 'shaman'
				major: ['vitality']
				minor: ['condition_damage', 'healing_power']
			when 'carrion'
				major: ['condition_damage']
				minor: ['power', 'vitality']
			when 'dire'
				major: ['condition_damage']
				minor: ['toughness', 'vitality']
			when 'rabid'
				major: ['condition_damage']
				minor: ['precision', 'toughness']
			when 'sinister'
				major: ['condition_damage']
				minor: ['power', 'precision']
			when 'apothecary'
				major: ['healing_power']
				minor: ['toughness', 'condition_damage']
			when 'cleric'
				major: ['healing_power']
				minor: ['power', 'toughness']
			when 'magi'
				major: ['healing_power']
				minor: ['precision', 'vitality']
			when 'celestial'
				minor: ['power', 'precision', 'toughness', 'vitality', 'condition_damage', 'ferocity', 'healing_power']
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
				major: ['power', 'condition_damage']
				minor: ['precision', 'expertise']
			when 'trailblazer'
				major: ['toughness', 'condition_damage']
				minor: ['vitality', 'expertise']
			when 'minstrel'
				major: ['toughness', 'healing_power']
				minor: ['vitality', 'concentration']
			when 'captain'
				major: ['precision']
				minor: ['power', 'toughness']

module.exports = StatCombinations