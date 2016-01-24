# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Renders the optimization result.

React = require 'react'

class Result extends React.Component
	render: ->
		return <div></div> if Object.keys(@props.result).length is 0

		console.log @props.result

		<div className="panel panel-success">
			<div className="panel-heading">Result</div>
			<div className="panel-body">
				<div><strong>Survivability:</strong> {@props.result.survivability}</div>
				<div><strong>Toughness/Vitality Ratio:</strong> {@props.result.toughness_vit_ratio}</div>
				<div>&nbsp;</div>
				<div><strong>Helm:</strong> {@props.result.slots.helm}</div>
				<div><strong>Shoulders:</strong> {@props.result.slots.shoulders}</div>
				<div><strong>Chest:</strong> {@props.result.slots.chest}</div>
				<div><strong>Gloves:</strong> {@props.result.slots.gloves}</div>
				<div><strong>Leggings:</strong> {@props.result.slots.leggings}</div>
				<div><strong>Boots:</strong> {@props.result.slots.boots}</div>
				<div>&nbsp;</div>
				{
					if @props.result.slots.hasOwnProperty('weapon2')
						<div><strong>Main-hand Weapon:</strong> {@props.result.slots.weapon1}</div>
					else
						<div><strong>Two-handed Weapon:</strong> {@props.result.slots.weapon1}</div>
				}
				{
					if @props.result.slots.hasOwnProperty('weapon2')
						<div><strong>Off-hand Weapon:</strong> {@props.result.slots.weapon2}</div>
				}
				<div>&nbsp;</div>
				<div><strong>Back:</strong> {@props.result.slots.back}</div>
				<div><strong>Amulet:</strong> {@props.result.slots.amulet}</div>
				<div><strong>Ring 1:</strong> {@props.result.slots.ring1}</div>
				<div><strong>Ring 2:</strong> {@props.result.slots.ring2}</div>
				<div><strong>Accessory 1:</strong> {@props.result.slots.accessory1}</div>
				<div><strong>Accessory 2:</strong> {@props.result.slots.accessory2}</div>
			</div>
		</div>

module.exports = Result