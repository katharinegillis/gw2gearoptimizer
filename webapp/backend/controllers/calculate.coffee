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
				two_weapons: false
				base:
					vitality: 1000
					hp: 5922
					toughness: 1000
					power: 1000
					precision: 1000
				item_defense: 1211
				min_survivability: 5001
				max_survivability: 5500
				primary_stat: 'power'
				gear_for: 'hot'
				healing: 10000
				selected_stat_combos: [
					'berserker'
					'knight'
					'cavalier'
					'carrion'
					'cleric'
					'magi'
					'assassin'
				]

			pop = new Population 50, true, character
			console.log 'Initial fittest gear_set:'
			console.log pop.getFittest().fitness

			ga = new GA character
			pop = ga.evolvePopulation pop
			for i in [0...2]
				pop = ga.evolvePopulation pop
			console.log 'Final fittest gear_set:'
			console.log pop.getFittest().fitness

		#	// Initialize population
        #Population pop = new Population(50, true);
        #System.out.println("Initial distance: " + pop.getFittest().getDistance());

        #// Evolve population for 100 generations
        #pop = GA.evolvePopulation(pop);
        #for (int i = 0; i < 100; i++) {
        #    pop = GA.evolvePopulation(pop);
        #}

			res.json
				survivability: '5001 (Durable)'
				toughness_vit_ratio: '1.12'
				slots:
					helm: 'Berserker'
					shoulders: 'Berserker'
					chest: 'Berserker'
					gloves: 'Berserker'
					leggings: 'Berserker'
					boots: 'Berserker'
					weapon1: 'Berserker'
					weapon2: 'Berserker'
					back: 'Berserker'
					amulet: 'Berserker'
					ring1: 'Berserker'
					ring2: 'Berserker'
					accessory1: 'Berserker'
					accessory2: 'Berserker'

	controller

module.exports = controllerFactory