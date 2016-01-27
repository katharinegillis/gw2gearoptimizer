# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines the genetic algorithm to find the near-optimal gear set.

modelFactory = (app, models) ->
	Population = models.Population
	GearSet = models.GearSet

	class GA
		constructor: (character) ->
			@mutationRate = 0.1;
			@tournamentSize = 5;
			@elitism = true;
			@character = character

		evolvePopulation: (population) ->
			console.log 'evolving population'
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
			valid = false
			while not valid
				[parent1_gear_data1, parent1_gear_data2, parent1_gear_data3] = parent1.getGearSetData()
				[parent2_gear_data1, parent2_gear_data2, parent2_gear_data3] = parent2.getGearSetData()

				mask1 = Math.floor Math.random() * 32
				mask2 = Math.floor Math.random() * 32
				mask3 = Math.floor Math.random() * 32

				parent3_gear_data = [
					parent1_gear_data1 & mask1 + parent2_gear_data1 & ~mask1
					parent1_gear_data2 & mask2 + parent2_gear_data2 & ~mask2
					parent1_gear_data3 & mask3 + parent2_gear_data3 & ~mask3
				]

				child = new GearSet @character, parent3_gear_data
				valid = child.isValid()

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
				if Math.random() < @mutationRate
					slot = gear_set.getSlot gearSlots[i]
					slot.randomizeStatCombo()
					gear_set.setSlot gearSlots[i], slot

			gear_set

		tournamentSelection: (population) ->
			tournament = new Population @tournamentSize, false, @character

			for i in [0...tournament.getPopulationSize()]
				index = Math.floor(Math.random() * population.getPopulationSize())
				tournament.saveGearSet i, population.getGearSet(index)

			tournament.getFittest()

	GA

module.exports = modelFactory