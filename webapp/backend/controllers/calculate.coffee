# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines the actions for the calculate controller.

controllerFactory = (app) ->
	controller =
		index: (req, res) ->
			GA = app.get('models').GA
			Population = app.get('models').Population

			if typeof req.body is 'string'
				req.body = JSON.parse req.body

			character =
				profession: req.body.profession
				two_weapons: if req.body.num_weapons is '2' then true else false
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

			console.log req.body.headgear

			if req.body.headgear isnt undefined and req.body.headgear isnt null and req.body.headgear isnt '' then character.headgear = [req.body.headgear] else character.headgear = character.selected_stat_combos
			if req.body.shoulders isnt undefined and req.body.shoulders isnt null and req.body.shoulders isnt '' then character.shoulders = [req.body.shoulders] else character.shoulders = character.selected_stat_combos
			if req.body.chest isnt undefined and req.body.chest isnt null and req.body.chest isnt '' then character.chest = [req.body.chest] else character.chest = character.selected_stat_combos
			if req.body.gloves isnt undefined and req.body.gloves isnt null and req.body.gloves isnt '' then character.gloves = [req.body.gloves] else character.gloves = character.selected_stat_combos
			if req.body.leggings isnt undefined and req.body.leggins isnt null and req.body.leggings isnt '' then character.leggings = [req.body.leggings] else character.leggings = character.selected_stat_combos
			if req.body.boots isnt undefined and req.body.boots isnt null and req.body.boots isnt '' then character.boots = [req.body.boots] else character.boots = character.selected_stat_combos
			if req.body.back isnt undefined and req.body.back isnt null and req.body.back isnt '' then character.back = [req.body.back] else character.back = character.selected_stat_combos
			if req.body.amulet isnt undefined and req.body.amulet isnt null and req.body.amulet isnt '' then character.amulet = [req.body.amulet] else character.amulet = character.selected_stat_combos
			if req.body.ring1 isnt undefined and req.body.ring1 isnt null and req.body.ring1 isnt '' then character.ring1 = [req.body.ring1] else character.ring1 = character.selected_stat_combos
			if req.body.ring2 isnt undefined and req.body.ring2 isnt null and req.body.ring2 isnt '' then character.ring2 = [req.body.ring2] else character.ring2 = character.selected_stat_combos
			if req.body.accessory1 isnt undefined and req.body.accessory1 isnt null and req.body.accessory1 isnt '' then character.accessory1 = [req.body.accessory1] else character.accessory1 = character.selected_stat_combos
			if req.body.accessory2 isnt undefined and req.body.accessory2 isnt null and req.body.accessory2 isnt '' then character.accessory2 = [req.body.accessory2] else character.accessory2 = character.selected_stat_combos
			if req.body.weapon1 isnt undefined and req.body.weapon1 isnt null and req.body.weapon1 isnt '' then character.weapon1 = [req.body.weapon1] else character.weapon1 = character.selected_stat_combos
			if req.body.weapon2 isnt undefined and req.body.weapon2 isnt null and req.body.weapon2 isnt '' then character.weapon2 = [req.body.weapon2] else character.weapon2 = character.selected_stat_combos

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

			response.slots.weapon2 = result.getSlot('weapon2').getStatComboName() if req.body.num_weapons is '2'

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
