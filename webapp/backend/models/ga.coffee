# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines the genetic algorithm to find the near-optimal gear set.

modelFactory = (app, models) ->
	Population = models.Population
	GearSet = models.GearSet

	class GA
		constructor: (character) ->
			@mutationRate = 0.015;
			@tournamentSize = 5;
			@elitism = true;
			@character = character

		evolvePopulation: (population) ->
			newPopulation = new Population population.populationSize(), false

			elitismOffset = 0
			if elitism
				newPopulation.saveGearSet 0, population.getFittest()
				elitismOffset = 1

			for i in [elitismOffset..population.populationSize()]
				parent1 = @tournamentSelection population
				parent2 = @tournamentSelection population

				child = @crossover parent1, parent2

				newPopulation.saveGearSet i, child

			for i in [elitismOffset..newPopulation.populationSize()]
				newPopulation.saveGearSet i, @mutate(newPopulation.getGearSet(i))

			newPopulation

		crossover: (parent1, parent2) ->
			gearSlots = [
				'headgear'
				'shoulder'
				'chest'
				'gloves'
				'leggings'
				'boots'
				'weapon1'
				'back'
				'amulet'
				'accessory1'
				'accessory2'
				'ring1'
				'ring2'
			]

			gearSlots.push['weapon2'] if @character.two_weapons

			slotsFromParent1 = []
			for i in [0..7]
				added = false
				while not added
					possibleSlot = gearSlots[Math.floor(Math.random() * gearSlots.length)]
					if slotsFromParent1.indexOf possibleSlot is -1
						slotsFromParent1.push possibleSlot
						added = true

			params = {}
			for slot in gearSlots
				if slotsFromParent1.indexOf slot isnt -1
					params[slot] = parent1.getSlot slot
				else
					params[slot] = parent2.getSlot slot

			child = new GearSet @character, params
			child

		mutate: (gear_set) ->
			gearSlots = [
				'headgear'
				'shoulder'
				'chest'
				'gloves'
				'leggings'
				'boots'
				'weapon1'
				'back'
				'amulet'
				'accessory1'
				'accessory2'
				'ring1'
				'ring2'
			]

			gearSlots.push['weapon2'] if @character.two_weapons

			for i in [0..gearSlots.length]
				if Math.random < @mutationRate
					slot = gear_set.getSlot gearSlots[i]
					slot.randomizeStatCombo()
					gear_set.setSlot gearSlots[i], slot

			gear_set

		tournamentSelection: (population) ->
			tournament = new Population @tournamentSize, false

			for i in [0..tournament.populationSize()]
				index = Math.floor Math.random() * population.populationSize()
				tournament.saveGearSet i, population.getGearSet(index)

			tournament.getFittest()

	GA

module.exports = modelFactory