# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines the population for the genetic algorithm.

modelFactory = (app, models) ->
	GearSet = models.GearSet

	class Population
		constructor: (populationSize, initialize, character) ->
			@population = []
			@populationSize = populationSize

			if (initialize)
				for i in [0...populationSize]
					new_gear_set = new GearSet character
					@saveGearSet(i, new_gear_set)

		saveGearSet: (index, gear_set) ->
			@population[index] = gear_set

		getGearSet: (index) ->
			@population[index]

		getFittest: ->
			fittest = @population[0]
			fittest.getFitness()

			populationSize = @population.length
			for i in [0...populationSize]
				gear_set = @getGearSet i
				console.log gear_set.getFitness()
				if fittest.getFitness() < gear_set.getFitness()
					fittest = gear_set

			fittest

		getPopulationSize: ->
			@populationSize

	Population

module.exports = modelFactory