# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Handles the optimization form data.

AppDispatcher             = require '../dispatcher/AppDispatcher.coffee'
EventEmitter              = require('events').EventEmitter
assign                    = require 'object-assign'
OptimizationFormConstants = require '../constants/OptimizationFormConstants.coffee'
_                         = require 'underscore'

_data =
	parents: {}
	options:
		profession:
			elementalist: 'Elementalist'
			engineer: 'Engineer'
			guardian: 'Guardian'
			mesmer: 'Mesmer'
			necromancer: 'Necromancer'
			ranger: 'Ranger'
			revenant: 'Revenant'
			thief: 'Thief'
			warrior: 'Warrior'
		primary_stat:
			power: 'Power'
			ferocity: 'Ferocity'
			condition_damage: 'Condition Damage'
			precision: 'Precision'
			healing_power: 'Healing Power'
			concentration: 'Concentration'
			expertise: 'Expertise'
		secondary_stat:
			power: 'Power'
			ferocity: 'Ferocity'
			condition_damage: 'Condition Damage'
			precision: 'Precision'
			healing_power: 'Healing Power'
			concentration: 'Concentration'
			expertise: 'Expertise'
		weapon:
			1: "Two-handed weapon"
			2: "Main-hand and Off-hand weapons"
		defensive_category:
			break_on_touch: 'Break On Touch'
			fragile: 'Fragile'
			middle_ground: 'Middle Ground'
			durable: 'Durable'
			tanky: 'Tanky'
			built_to_last: 'Built To Last'
			moving_fortress: 'Moving Fortress'
		gear_for:
			core: 'Central Tyria'
			hot: 'Heart of Thorns'
		stat:
			berserker: 'Berserker (power, precision, ferocity)'
			zealot: 'Zealot (power, precision, healing power)'
			soldier: 'Soldier (power, toughness, vitality)'
			captain: 'Captain (power, precision, toughness)'
			valkyrie: 'Valkyrie (power, vitality, ferocity)'
			rampager: 'Rampager (precision, power, condition damage)'
			assassin: 'Assassin (precision, power, ferocity)'
			knight: 'Knight (toughness, power, precision)'
			cavalier: 'Cavalier (toughness, power, ferocity)'
			nomad: 'Nomad (toughness, vitality, healing power)'
			settler: 'Settler (toughness, condition damage, healing power)'
			sentinel: 'Sentinel (vitality, power, toughness)'
			shaman: 'Shaman (vitality, condition damage, healing power)'
			sinister: 'Sinister (condition damage, power, precision)'
			carrion: 'Carrion (condition damage, power, vitality)'
			rabid: 'Rabid (condition damage, precision, toughness)'
			dire: 'Dire (condition damage, toughness, vitality)'
			cleric: 'Cleric (healing power, power, toughness)'
			magi: 'Magi (healing power, precision, vitality)'
			apothecary: 'Apothecary (healing power, toughness, condition damage)'
			commander: 'Commander (power, precision, toughness, concentration)'
			marauder: 'Marauder (power, precision, vitality, ferocity)'
			vigilant: 'Vigilant (power, toughness, concentration, expertise)'
			crusader: 'Crusader (power, toughness, ferocity, healing power)'
			wanderer: 'Wanderer (power, vitality, toughness, concentration)'
			viper: 'Viper (power, condition damage, precision, expertise)'
			trailblazer: 'Trailblazer (toughness, condition damage, vitality, expertise)'
			minstrel: 'Minstrel (toughness, healing power, vitality, concentration)'
		gear_level:
			ascended: 'Ascended'
			exotic: 'Exotic'
		armour: {}
		weapon: {}
		back: {}
		amulet: {}
		ring: {}
		accessory: {}

CHANGE_EVENT = 'change'

displayName = (value) ->
	switch value
		when 'berserker' then 'Berserker'
		when 'zealot' then 'Zealot'
		when 'soldier' then 'Soldier'
		when 'valkyrie' then 'Valkyrie'
		when 'rampager' then 'Rampager'
		when 'assassin' then 'Assassin'
		when 'knight' then 'Knight'
		when 'cavalier' then 'Cavalier'
		when 'nomad' then 'Nomad'
		when 'settler' then 'Settler'
		when 'sentinel' then 'Sentinel'
		when 'shaman' then 'Shaman'
		when 'sinister' then 'Sinister'
		when 'carrion' then 'Carrion'
		when 'rabid' then 'Rabid'
		when 'dire' then 'Dire'
		when 'cleric' then 'Cleric'
		when 'magi' then 'Magi'
		when 'apothecary' then 'Apothecary'
		when 'commander' then 'Commander'
		when 'marauder' then 'Marauder'
		when 'vigilant' then 'Vigilant'
		when 'crusader' then 'Crusader'
		when 'wanderer' then 'Wanderer'
		when 'viper' then 'Viper'
		when 'trailblazer' then 'Trailblazer'
		when 'minstrel' then 'Minstrel'
		when 'captain' then 'Captain'

narrowOptions = (gear_level, selected_options) ->
	armour = _.intersection _data.parents[gear_level].armour, selected_options
	weapon = _.intersection _data.parents[gear_level].weapon, selected_options
	back = _.intersection _data.parents[gear_level].back, selected_options
	amulet = _.intersection _data.parents[gear_level].amulet, selected_options
	ring = _.intersection _data.parents[gear_level].ring, selected_options
	accessory = _.intersection _data.parents[gear_level].accessory, selected_options

	console.log selected_options

	_data.options.armour = {}
	_data.options.weapon = {}
	_data.options.back = {}
	_data.options.amulet = {}
	_data.options.ring = {}
	_data.options.accessory = {}

	for stat in armour
		_data.options.armour[stat] = displayName stat

	for stat in weapon
		_data.options.weapon[stat] = displayName stat

	for stat in back
		_data.options.back[stat] = displayName stat

	for stat in amulet
		_data.options.amulet[stat] = displayName stat

	for stat in ring
		_data.options.ring[stat] = displayName stat

	for stat in accessory
		_data.options.accessory[stat] = displayName stat

	console.log _data.options

OptimizationFormStore = assign {}, EventEmitter.prototype,
	getOptions: ->
		_data.options

	emitChange: ->
		@emit CHANGE_EVENT

	addChangeListener: (callback) ->
		@on CHANGE_EVENT, callback

	removeChangeListener: (callback) ->
		@removeListener CHANGE_EVENT, callback

AppDispatcher.register (action) ->
	switch action.action_type
		when OptimizationFormConstants.RECEIVE_OPTIONS
			_data.parents = action.data
			OptimizationFormStore.emitChange()
		when OptimizationFormConstants.NARROW_OPTIONS
			narrowOptions action.gear_level, action.selected_options
			OptimizationFormStore.emitChange()

module.exports = OptimizationFormStore