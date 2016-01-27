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

			pop = new Population 100, true, character

			ga = new GA character
			pop = ga.evolvePopulation pop
			for i in [0...10]
				pop = ga.evolvePopulation pop
				console.log 'generation:'
				console.log pop.getFittest().fitness
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
					helm: capitalize result.getSlot('headgear').getStatCombo()
					shoulders: capitalize result.getSlot('shoulders').getStatCombo()
					chest: capitalize result.getSlot('chest').getStatCombo()
					gloves: capitalize result.getSlot('gloves').getStatCombo()
					leggings: capitalize result.getSlot('leggings').getStatCombo()
					boots: capitalize result.getSlot('boots').getStatCombo()
					weapon1: capitalize result.getSlot('weapon1').getStatCombo()
					back: capitalize result.getSlot('back').getStatCombo()
					amulet: capitalize result.getSlot('amulet').getStatCombo()
					ring1: capitalize result.getSlot('ring1').getStatCombo()
					ring2: capitalize result.getSlot('ring2').getStatCombo()
					accessory1: capitalize result.getSlot('accessory1').getStatCombo()
					accessory2: capitalize result.getSlot('accessory2').getStatCombo()

			response.slots.weapon2 = capitalize result.getSlot('weapon2').getStatCombo() if req.body.weapon is '2'

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