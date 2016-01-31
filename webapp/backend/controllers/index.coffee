# @file
# @author Katharine Cordes
# @date   1/21/16
# @brief  Defines the index actions.

factory = (app) ->
	controller =
		index: (req, res) ->
			res.render 'index'

	controller

module.exports = factory