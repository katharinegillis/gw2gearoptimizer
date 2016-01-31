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
				secondary_stat: req.body.secondary_stat
				gear_for: req.body.gear_for
				healing: parseInt req.body.healing
				selected_stat_combos: []
				gear_level: req.body.gear_level

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
				when 'built_to_last'
					character.min_survivability = 5501
					character.max_survivability = 6000
				when 'moving_fortress'
					character.min_survivability = 6001
					character.max_survivability = 10000
				else
					character.min_survivability = 0
					character.max_survivability = 0

			for stat_combo, value of req.body.stats
				character.selected_stat_combos.push stat_combo if value

			
			endTime = Math.floor(new Date() / 1000) + 25

			pop = new Population 50, true, character

			ga = new GA character
			pop = ga.evolvePopulation pop
			while Math.floor(new Date() / 1000) < endTime
				pop = ga.evolvePopulation pop
			result = pop.getFittest()

			response =
				toughness_vit_ratio: result.toughness_vit_ratio
				primary:
					name: character.primary_stat
					value: result.stats[character.primary_stat]
				secondary:
					name: character.secondary_stat
					value: result.stats[character.secondary_stat]
				slots:
					helm: result.getSlot('headgear').getStatComboName()
					shoulders: result.getSlot('shoulders').getStatComboName()
					chest: result.getSlot('chest').getStatComboName()
					gloves: result.getSlot('gloves').getStatComboName()
					leggings: result.getSlot('leggings').getStatComboName()
					boots: result.getSlot('boots').getStatComboName()
					weapon1: result.getSlot('weapon1').getStatComboName()
					back: result.getSlot('back').getStatComboName()
					amulet: result.getSlot('amulet').getStatComboName()
					ring1: result.getSlot('ring1').getStatComboName()
					ring2: result.getSlot('ring2').getStatComboName()
					accessory1: result.getSlot('accessory1').getStatComboName()
					accessory2: result.getSlot('accessory2').getStatComboName()
				fitness: result.fitness

			response.slots.weapon2 = result.getSlot('weapon2').getStatComboName() if req.body.weapon is '2'

			if result.survivability < 3500
				response.survivability =
					name: 'break_on_touch'
					value: result.survivability
			else if 3501 < result.survivability < 4000
				response.survivability =
					name: 'fragile'
					value: result.survivability
			else if 4001 < result.survivability < 4500
				response.survivability =
					name: 'middle_ground'
					value: result.survivability
			else if 4501 < result.survivability < 5000
				response.survivability =
					name: 'durable'
					value: result.survivability
			else if 5001 < result.survivability < 5500
				response.survivability =
					name: 'tanky'
					value: result.survivability
			else if 5501 < result.survivability < 6000
				response.survivability =
					name: 'built_to_last'
					value: result.survivability
			else
				response.survivability =
					name: 'moving_fortress'
					value: result.survivability

			res.json response

	controller

module.exports = controllerFactory
