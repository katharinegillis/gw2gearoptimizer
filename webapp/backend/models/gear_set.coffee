# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a full gear set.

StatCombinations = require '../utils/stat_combinations'

modelFactory = (app, models) ->
	HeadgearSlot      = models.HeadgearSlot
	ShoulderSlot      = models.ShoulderSlot
	ChestSlot         = models.ChestSlot
	GlovesSlot        = models.GlovesSlot
	LeggingsSlot      = models.LeggingsSlot
	BootsSlot         = models.BootsSlot
	OneHandWeaponSlot = models.OneHandWeaponSlot
	TwoHandWeaponSlot = models.TwoHandWeaponSlot
	AmuletSlot        = models.AmuletSlot
	RingSlot          = models.RingSlot
	AccessorySlot     = models.AccessorySlot
	BackSlot          = models.BackSlot

	class GearSet
		constructor: (character, gear) ->
			@character = character
			@gear = {}
			@fitness = 0
			@gear_stats = {}

			if gear isnt null and gear isnt undefined
				@gear = gear
			else
				@gear.headgear = new HeadgearSlot @character.selected_stat_combos
				@gear.shoulders = new ShoulderSlot @character.selected_stat_combos
				@gear.chest = new ChestSlot @character.selected_stat_combos
				@gear.gloves = new GlovesSlot @character.selected_stat_combos
				@gear.leggings = new LeggingsSlot @character.selected_stat_combos
				@gear.boots = new BootsSlot @character.selected_stat_combos

				if @character.two_weapons
					@gear.weapon1 = new OneHandWeaponSlot @character.selected_stat_combos
					@gear.weapon2 = new OneHandWeaponSlot @character.selected_stat_combos
				else
					@gear.weapon1 = new TwoHandWeaponSlot @character.selected_stat_combos

				@gear.back = new BackSlot @character.selected_stat_combos
				@gear.accessory1 = new AccessorySlot @character.selected_stat_combos
				@gear.accessory2 = new AccessorySlot @character.selected_stat_combos
				@gear.amulet = new AmuletSlot @character.selected_stat_combos
				@gear.ring1 = new RingSlot @character.selected_stat_combos
				@gear.ring2 = new RingSlot @character.selected_stat_combos

		getSlot: (index) ->
			@gear[index]

		setSlot: (index, slot) ->
			@gear[index] = slot
			@fitness = 0

		getFitness: ->
			if @fitness is 0
				stats = @getGearStats()
				stats = StatCombinations.mergeStats stats, @character.base
				stats.hp += stats.vitality * 10
				@stats = stats

				@survivability = stats.hp * (@character.item_defense + stats.toughness) / 10000
				@fitness = 10000 if @character.min_survivability <= @survivability <= @character.max_survivability

				@fitness += stats[@character.primary_stat] if stats.hasOwnProperty(@character.primary_stat)

				if @character.gear_for is 'core' then ratio = 0.9 else ratio = 0.7
				@toughness_vit_ratio = ratio * (stats.hp + @character.healing) / (@character.item_defense + stats.toughness) / 10
				inverse_ratio = 1 / ((@toughness_vit_ratio - 1) * (@toughness_vit_ratio - 1))
				#inverse_ratio = 1 / Math.abs(toughness_vit_ratio - 1)
				@fitness += 100 * inverse_ratio
				@fitness = Math.floor @fitness

			@fitness

		getGearStats: ->
			stats = @gear.headgear.getStats()
			stats = StatCombinations.mergeStats stats, @gear.shoulders.getStats()
			stats = StatCombinations.mergeStats stats, @gear.chest.getStats()
			stats = StatCombinations.mergeStats stats, @gear.gloves.getStats()
			stats = StatCombinations.mergeStats stats, @gear.leggings.getStats()
			stats = StatCombinations.mergeStats stats, @gear.boots.getStats()
			stats = StatCombinations.mergeStats stats, @gear.weapon1.getStats()
			stats = StatCombinations.mergeStats stats, @gear.weapon2.getStats() if @gear.hasOwnProperty('weapon2')
			stats = StatCombinations.mergeStats stats, @gear.back.getStats()
			stats = StatCombinations.mergeStats stats, @gear.accessory1.getStats()
			stats = StatCombinations.mergeStats stats, @gear.accessory2.getStats()
			stats = StatCombinations.mergeStats stats, @gear.amulet.getStats()
			stats = StatCombinations.mergeStats stats, @gear.ring1.getStats()
			stats = StatCombinations.mergeStats stats, @gear.ring2.getStats()
			stats

	GearSet

module.exports = modelFactory