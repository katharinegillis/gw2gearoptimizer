# @file
# @author Katharine Cordes
# @date   2/11/16
# @brief  Defines the actions for the calculate controller.

StatCombinations = require '../utils/stat_combinations'

controllerFactory = (app) ->
	controller =
		availableCombos: (req, res) ->
			all_combinations = [
				'berserker'
				'zealot'
				'soldier'
				'captain'
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

			armour = StatCombinations.getArmourAvailableStatCombinations all_combinations
			weapon = StatCombinations.getWeaponAvailableStatCombinations all_combinations
			back = StatCombinations.getBackAvailableStatCombinations all_combinations
			amulet = StatCombinations.getAmuletAvailableStatCombinations all_combinations
			ring = StatCombinations.getRingAvailableStatCombinations all_combinations
			accessory = StatCombinations.getAccessoryAvailableStatCombinations all_combinations

			exotic_armour = StatCombinations.getArmourAvailableExoticStatCombinations all_combinations
			exotic_weapon = StatCombinations.getWeaponAvailableExoticStatCombinations all_combinations
			exotic_back = StatCombinations.getBackAvailableExoticStatCombinations all_combinations
			exotic_amulet = StatCombinations.getAmuletAvailableExoticStatCombinations all_combinations
			exotic_ring = StatCombinations.getRingAvailableExoticStatCombinations all_combinations
			exotic_accessory = StatCombinations.getAccessoryAvailableExoticStatCombinations all_combinations

			response =
				ascended:
					armour: armour
					weapon: weapon
					back: back
					amulet: amulet
					ring: ring
					accessory: accessory
				exotic:
					armour: exotic_armour
					weapon: exotic_weapon
					back: exotic_back
					amulet: exotic_amulet
					ring: exotic_ring
					accessory: exotic_accessory

			res.json response

	controller

module.exports = controllerFactory
