# @file
# @author Katharine Cordes
# @date   1/24/16
# @brief  Defines the actions for the calculate controller.

controllerFactory = (app) ->
	controller =
		index: (req, res) ->
			params = req.params.params

			console.log req.body

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