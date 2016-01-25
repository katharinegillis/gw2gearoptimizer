# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines a full gear set.

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

			if gear isnt null
				@gear = gear
			else
				@gear.headgear = new HeadgearSlot()
				@gear.shoulders = new ShoulderSlot()
				@gear.chest = new ChestSlot()
				@gear.gloves = new GlovesSlot()
				@gear.leggings = new LeggingsSlot()
				@gear.boots = new BootsSlot()

				if @character.two_weapons
					@gear.weapon1 = new OneHandWeaponSlot()
					@gear.weapon2 = new OneHandWeaponSlot()
				else
					@gear.weapon1 = new TwoHandWeaponSlot()

				@gear.back = new BackSlot()
				@gear.accessory1 = new AccessorySlot()
				@gear.accessory2 = new AccessorySlot()
				@gear.amulet = new AmuletSlot()
				@gear.ring1 = new RingSlot()
				@gear.ring2 = new RingSlot()

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

				survivability = stats.hp * (stats.item_defense + stats.toughness) / 10000
				@fitness = 10000 if stats.min_survivability <= survivability <= stats.max_survivability

				@fitness += stats[@character.primary_stat]

				if @character.gear_for is 'core' then ratio = 0.9 else 0.7
				toughness_vit_ratio = ratio * (stats.hp + @character.healing) / (stats.item_defense + stats.toughness) / 10
				@fitness += 5000 * Math.abs(1 - toughness_vit_ratio)

			@fitness

		getGearStats: ->
			stats = @gear.headgear.getStats()
			stats = StatCombinations.mergeStats stats, @gear.shoulder.getStats()
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