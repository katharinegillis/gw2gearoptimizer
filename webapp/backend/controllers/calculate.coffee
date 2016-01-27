# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines the actions for the calculate controller.

controllerFactory = (app) ->
	controller =
		index: (req, res) ->
			params = req.params.params

			GA = app.get('models').GA
			Population = app.get('models').Population

			character =
				profession: req.body.profession
				two_weapons: if req.body.weapon is '2' then true else false
				base:
					vitality: 1000
					toughness: 1000
					power: 1000
					precision: 1000
				primary_stat: req.body.primary_stat
				gear_for: req.body.gear_for
				healing: parseInt req.body.healing
				selected_stat_combos: []

			switch req.body.profession
				when 'revenant', 'warrior', 'guardian'
					character.item_defense = 1271
				when 'thief', 'engineer', 'ranger'
					character.item_defense = 1118
				when 'mesmer', 'elementalist', 'necromancer'
					character.item_defense = 967
				else
					character.item_defense = 0

			switch req.body.profession
				when 'revenant', 'ranger', 'engineer', 'mesmer'
					character.base.hp = 5922
				when 'warrior', 'necromancer'
					character.base.hp = 9212
				when 'elementalist', 'thief'
					character.base.hp = 1645
				else
					character.base.hp = 0

			switch req.body.defensive_category
				when 'break_on_touch'
					character.min_survivability = 1
					character.max_survivability = 3500
				when 'fragile'
					character.min_survivability = 3501
					character.max_survivability = 4000
				when 'middle_ground'
					character.min_survivability = 4001
					character.max_survivability = 4500
				when 'durable'
					character.min_survivability = 4501
					character.max_survivability = 5000
				when 'tanky'
					character.min_survivability = 5001
					character.max_survivability = 5500
				when 'built_to_lastl'
					character.min_survivability = 5501
					character.max_survivability = 6000
				when 'moving_fortress'
					character.min_survivability = 6001
					character.max_survivability = 10000
				else
					character.min_survivability = 0
					character.max_survivability = 0

			for stat_combo, value of req.body.core_stats
				character.selected_stat_combos.push stat_combo if value

			for stat_combo, value of req.body.hot_stats
				character.selected_stat_combos.push stat_combo if value

			#GearSet = app.get('models').GearSet
			#individual = new GearSet character
			#console.log individual.getGearSetData()

			#ga = new GA character
			#individual = ga.mutate individual
			#console.log individual.getGearSetData()
			#return

			pop = new Population 50, true, character

			ga = new GA character
			pop = ga.evolvePopulation pop
			for i in [0...1000]
				pop = ga.evolvePopulation pop
			result = pop.getFittest()

			capitalize = (string) ->
    			string.charAt(0).toUpperCase() + string.substring(1).toLowerCase()

			response =
				survivability: result.survivability
				toughness_vit_ratio: result.toughness_vit_ratio
				primary:
					name: capitalize character.primary_stat
					value: result.stats[character.primary_stat]
				slots:
					helm: capitalize result.getSlot('headgear').getStatComboName()
					shoulders: capitalize result.getSlot('shoulders').getStatComboName()
					chest: capitalize result.getSlot('chest').getStatComboName()
					gloves: capitalize result.getSlot('gloves').getStatComboName()
					leggings: capitalize result.getSlot('leggings').getStatComboName()
					boots: capitalize result.getSlot('boots').getStatComboName()
					weapon1: capitalize result.getSlot('weapon1').getStatComboName()
					back: capitalize result.getSlot('back').getStatComboName()
					amulet: capitalize result.getSlot('amulet').getStatComboName()
					ring1: capitalize result.getSlot('ring1').getStatComboName()
					ring2: capitalize result.getSlot('ring2').getStatComboName()
					accessory1: capitalize result.getSlot('accessory1').getStatComboName()
					accessory2: capitalize result.getSlot('accessory2').getStatComboName()
				fitness: result.fitness

			response.slots.weapon2 = capitalize result.getSlot('weapon2').getStatComboName() if req.body.weapon is '2'

			if response.survivability < 3500
				response.survivability = '' + response.survivability + ' (Break on touch)'
			else if 3501 < response.survivability < 4000
				response.survivability = '' + response.survivability + ' (Fragile)'
			else if 4001 < response.survivability < 4500
				response.survivability = '' + response.survivability + ' (Middle Ground)'
			else if 4501 < response.survivability < 5000
				response.survivability = '' + response.survivability + ' (Durable)'
			else if 5001 < response.survivability < 5500
				response.survivability = '' + response.survivability + ' (Tanky)'
			else if 5501 < response.survivability < 6000
				response.survivability = '' + response.survivability + ' (Built To Last)'
			else
				response.survivability = '' + response.survivability + ' (Moving Fortress)'

			res.json response

	controller

module.exports = controllerFactory