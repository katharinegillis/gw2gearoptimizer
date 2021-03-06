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
		constructor: (character, gear_set_data) ->
			@character = character
			@gear = {}
			@fitness = 0
			@stats = {}
			@gear_set_data = []

			if gear_set_data isnt null and gear_set_data isnt undefined
				# must convert to 3 integers, max 32 bits each.
				[gear_set_data1, gear_set_data2, gear_set_data3] = gear_set_data

				@gear.leggings = new LeggingsSlot @character.gear_level, @character.leggings
				@gear.leggings.setStatData gear_set_data1 & @gear.leggings.getStatDataMask()
				gear_set_data1 = gear_set_data1 >> @gear.leggings.getStatDataLength()

				@gear.gloves = new GlovesSlot @character.gear_level, @character.gloves
				@gear.gloves.setStatData gear_set_data1 & @gear.gloves.getStatDataMask()
				gear_set_data1 = gear_set_data1 >> @gear.gloves.getStatDataLength()

				@gear.chest = new ChestSlot @character.gear_level, @character.chest
				@gear.chest.setStatData gear_set_data1 & @gear.chest.getStatDataMask()
				gear_set_data1 = gear_set_data1 >> @gear.chest.getStatDataLength()

				@gear.shoulders = new ShoulderSlot @character.gear_level, @character.shoulders
				@gear.shoulders.setStatData gear_set_data1 & @gear.shoulders.getStatDataMask()
				gear_set_data1 = gear_set_data1 >> @gear.shoulders.getStatDataLength()

				@gear.headgear = new HeadgearSlot @character.gear_level, @character.headgear
				@gear.headgear.setStatData gear_set_data1 & @gear.headgear.getStatDataMask()

				if @character.two_weapons
					@gear.weapon2 = new OneHandWeaponSlot @character.gear_level, @character.weapon2
					@gear.weapon2.setStatData gear_set_data2 & @gear.weapon2.getStatDataMask()
					gear_set_data2 = gear_set_data2 >> @gear.weapon2.getStatDataLength()

				if @character.two_weapons
					@gear.weapon1 = new OneHandWeaponSlot @character.gear_level, @character.weapon1
				else
					@gear.weapon1 = new TwoHandWeaponSlot @character.gear_level, @character.weapon1

				@gear.weapon1.setStatData gear_set_data2 & @gear.weapon1.getStatDataMask()
				gear_set_data2 = gear_set_data2 >> @gear.weapon1.getStatDataLength()

				@gear.back = new BackSlot @character.gear_level, @character.back
				@gear.back.setStatData gear_set_data2 & @gear.back.getStatDataMask()
				gear_set_data2 = gear_set_data2 >> @gear.back.getStatDataLength()

				@gear.boots = new BootsSlot @character.gear_level, @character.boots
				@gear.boots.setStatData gear_set_data2 & @gear.boots.getStatDataMask()

				@gear.accessory2 = new AccessorySlot @character.gear_level, @character.accessory2
				@gear.accessory2.setStatData gear_set_data3 & @gear.accessory2.getStatDataMask()
				gear_set_data3 = gear_set_data3 >> @gear.accessory2.getStatDataLength()

				@gear.accessory1 = new AccessorySlot @character.gear_level, @character.accessory1
				@gear.accessory1.setStatData gear_set_data3 & @gear.accessory1.getStatDataMask()
				gear_set_data3 = gear_set_data3 >> @gear.accessory1.getStatDataLength()

				@gear.ring2 = new RingSlot @character.gear_level, @character.ring2
				@gear.ring2.setStatData gear_set_data3 & @gear.ring2.getStatDataMask()
				gear_set_data3 = gear_set_data3 >> @gear.ring2.getStatDataLength()

				@gear.ring1 = new RingSlot @character.gear_level, @character.ring1
				@gear.ring1.setStatData gear_set_data3 & @gear.ring1.getStatDataMask()
				gear_set_data3 = gear_set_data3 >> @gear.ring1.getStatDataLength()

				@gear.amulet = new AmuletSlot @character.gear_level, @character.amulet
				@gear.amulet.setStatData gear_set_data3 & @gear.amulet.getStatDataMask()

			else
				@gear.headgear = new HeadgearSlot @character.gear_level, @character.headgear
				@gear.shoulders = new ShoulderSlot @character.gear_level, @character.shoulders
				@gear.chest = new ChestSlot @character.gear_level, @character.chest
				@gear.gloves = new GlovesSlot @character.gear_level, @character.gloves
				@gear.leggings = new LeggingsSlot @character.gear_level, @character.leggings
				@gear.boots = new BootsSlot @character.gear_level, @character.boots

				if @character.two_weapons
					@gear.weapon1 = new OneHandWeaponSlot @character.gear_level, @character.weapon1
					@gear.weapon2 = new OneHandWeaponSlot @character.gear_level, @character.weapon2
				else
					@gear.weapon1 = new TwoHandWeaponSlot @character.gear_level, @character.weapon1

				@gear.back = new BackSlot @character.gear_level, @character.back
				@gear.accessory1 = new AccessorySlot @character.gear_level, @character.accessory1
				@gear.accessory2 = new AccessorySlot @character.gear_level, @character.accessory2
				@gear.amulet = new AmuletSlot @character.gear_level, @character.amulet
				@gear.ring1 = new RingSlot @character.gear_level, @character.ring1
				@gear.ring2 = new RingSlot @character.gear_level, @character.ring2

		getSlot: (index) ->
			@gear[index]

		setSlot: (index, slot) ->
			@gear[index] = slot
			@fitness = 0
			@gear_set_data = []

		getFitness: ->
			if @fitness is 0
				stats = @getGearStats()
				stats = StatCombinations.mergeStats stats, @character.base
				stats.hp += stats.vitality * 10
				@stats = stats

				@survivability = Math.floor(stats.hp * (@character.item_defense + stats.toughness) / 10000)
				@fitness = 10000 if @character.min_survivability <= @survivability <= @character.max_survivability

				@fitness += stats[@character.primary_stat] * 2 if stats.hasOwnProperty(@character.primary_stat)
				@fitness += stats[@character.secondary_stat] if stats.hasOwnProperty(@character.secondary_stat)

				if @character.gear_for is 'core' then ratio = 0.9 else ratio = 0.7
				@toughness_vit_ratio = ratio * (stats.hp + @character.healing) / (@character.item_defense + stats.toughness) / 10
				inverse_ratio = 1 / Math.abs(@toughness_vit_ratio - 1)
				@fitness += Math.min 200 * inverse_ratio, 2000
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

		getGearSetData: ->
			# must convert to 3 integers, max 32 bits each.
			return @gear_set_data if @gear_set_data.length isnt 0

			gear_set_data1 = 0
			gear_set_data1 = (gear_set_data1 << @gear.headgear.getStatDataLength()) + @gear.headgear.getStatData()
			gear_set_data1 = (gear_set_data1 << @gear.shoulders.getStatDataLength()) + @gear.shoulders.getStatData()
			gear_set_data1 = (gear_set_data1 << @gear.chest.getStatDataLength()) + @gear.chest.getStatData()
			gear_set_data1 = (gear_set_data1 << @gear.gloves.getStatDataLength()) + @gear.gloves.getStatData()
			gear_set_data1 = (gear_set_data1 << @gear.leggings.getStatDataLength()) + @gear.leggings.getStatData()

			gear_set_data2 = 0
			gear_set_data2 = (gear_set_data2 << @gear.boots.getStatDataLength()) + @gear.boots.getStatData()
			gear_set_data2 = (gear_set_data2 << @gear.back.getStatDataLength()) + @gear.back.getStatData()
			gear_set_data2 = (gear_set_data2 << @gear.weapon1.getStatDataLength()) + @gear.weapon1.getStatData()
			gear_set_data2 = (gear_set_data2 << @gear.weapon2.getStatDataLength()) + @gear.weapon2.getStatData() if @character.two_weapons

			gear_set_data3 = 0
			gear_set_data3 = (gear_set_data3 << @gear.amulet.getStatDataLength()) + @gear.amulet.getStatData()
			gear_set_data3 = (gear_set_data3 << @gear.ring1.getStatDataLength()) + @gear.ring1.getStatData()
			gear_set_data3 = (gear_set_data3 << @gear.ring2.getStatDataLength()) + @gear.ring2.getStatData()
			gear_set_data3 = (gear_set_data3 << @gear.accessory1.getStatDataLength()) + @gear.accessory1.getStatData()
			gear_set_data3 = (gear_set_data3 << @gear.accessory2.getStatDataLength()) + @gear.accessory2.getStatData()

			

			[gear_set_data1, gear_set_data2, gear_set_data3]

		isValid: ->
			valid = @gear.headgear.isValid() and @gear.shoulders.isValid() and @gear.chest.isValid() and @gear.gloves.isValid()
			valid = valid and @gear.leggings.isValid() and @gear.boots.isValid() and @gear.back.isValid() and @gear.weapon1.isValid()
			valid = valid and @gear.amulet.isValid() and @gear.ring1.isValid() and @gear.ring2.isValid() and @gear.accessory1.isValid() and @gear.accessory2.isValid()
			valid = valid and @gear.weapon2.isValid() if @character.two_weapons
			valid

	GearSet

module.exports = modelFactory
