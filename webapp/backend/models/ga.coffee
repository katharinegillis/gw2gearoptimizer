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
			@tournamentSize = 10;
			@elitism = true;
			@character = character

		evolvePopulation: (population) ->
			newPopulation = new Population population.getPopulationSize(), false, @character

			elitismOffset = 0
			if @elitism
				newPopulation.saveGearSet 0, population.getFittest()
				elitismOffset = 1

			for i in [elitismOffset...population.getPopulationSize()]
				parent1 = @tournamentSelection population
				parent2 = @tournamentSelection population

				child = @crossover parent1, parent2

				newPopulation.saveGearSet i, child

			for i in [elitismOffset...newPopulation.getPopulationSize()]
				newPopulation.saveGearSet i, @mutate(newPopulation.getGearSet(i))

			newPopulation

		crossover: (parent1, parent2) ->
			[parent1_gear_data1, parent1_gear_data2] = parent1.getGearSetData()
			[parent2_gear_data1, parent2_gear_data2] = parent2.getGearSetData()

		crossover: (parent1, parent2) ->
			gearSlots = [
				'headgear'
				'shoulders'
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

			gearSlots.push 'weapon2' if @character.two_weapons

			slots = {}
			for slot in gearSlots
				if Math.floor(Math.random() * 2) is 0
					slots[slot] = parent1.getSlot slot
				else
					slots[slot] = parent2.getSlot slot

			child = new GearSet @character, slots
			child

		mutate: (gear_set) ->
			gearSlots = [
				'headgear'
				'shoulders'
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

			gearSlots.push 'weapon2' if @character.two_weapons

			for i in [0...gearSlots.length]
				if Math.random < @mutationRate
					slot = gear_set.getSlot gearSlots[i]
					slot.randomizeStatCombo()
					gear_set.setSlot gearSlots[i], slot

			gear_set

		tournamentSelection: (population) ->
			tournament = new Population @tournamentSize, false, @character

			for i in [0...tournament.getPopulationSize()]
				index = Math.floor(Math.random() * population.getPopulationSize())
				console.log index
				tournament.saveGearSet i, population.getGearSet(index)

			console.log 'tournament:'
			console.log tournament.getFittest().fitness
			tournament.getFittest()

	GA

module.exports = modelFactory