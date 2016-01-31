# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Renders the optimization result.

React = require 'react'

class Result extends React.Component
	displayValue: (string) ->
		switch string
			when 'break_on_touch' then 'Break On Touch'
			when 'fragile' then 'Fragile'
			when 'middle_ground' then 'Middle Ground'
			when 'durable' then 'Durable'
			when 'tanky' then 'Tanky'
			when 'built_to_last' then 'Built To Last'
			when 'moving_fortress' then 'Moving Fortress'
			when 'berserker' then 'Berserker'
			when 'zealot' then 'Zealot'
			when 'soldier' then 'Soldier'
			when 'valkyrie' then 'Valkyrie'
			when 'rampager' then 'Rampager'
			when 'assassin' then 'Assassin'
			when 'knight' then 'Knight'
			when 'cavalier' then 'Cavalier'
			when 'nomad' then 'Nomad'
			when 'settler' then 'Settler'
			when 'sentinel' then 'Sentinel'
			when 'shaman' then 'Shaman'
			when 'sinister' then 'Sinister'
			when 'carrion' then 'Carrion'
			when 'rabid' then 'Rabid'
			when 'dire' then 'Dire'
			when 'cleric' then 'Cleric'
			when 'magi' then 'Magi'
			when 'apothecary' then 'Apothecary'
			when 'commander' then 'Commander'
			when 'marauder' then 'Marauder'
			when 'vigilant' then 'Vigilant'
			when 'crusader' then 'Crusader'
			when 'wanderer' then 'Wanderer'
			when 'viper' then 'Viper'
			when 'trailblazer' then 'Trailblazer'
			when 'minstrel' then 'Minstrel'
			when 'captain' then 'Captain'
			when 'power' then 'Power'
			when 'precision' then 'Precision'
			when 'ferocity' then 'Ferocity'
			when 'toughness' then 'Toughness'
			when 'vitality' then 'Vitality'
			when 'healing_power' then 'Healing Power'
			when 'condition_damage' then 'Condition Damage'
			when 'concentration' then 'Concentration'
			when 'expertise' then 'Expertise'

	render: ->
		return <div></div> if Object.keys(@props.result).length is 0

		<div className="panel panel-success result">
			<div className="panel-heading">Result</div>
			<div className="panel-body">
				<div><strong>Fitness:</strong> {@props.result.fitness}</div>
				<div><strong>Survivability:</strong> {@props.result.survivability.value} ({@displayValue @props.result.survivability.name})</div>
				<div><strong>Toughness/Vitality Ratio:</strong> {@props.result.toughness_vit_ratio}</div>
				<div><strong>{@displayValue @props.result.primary.name}:</strong> {@props.result.primary.value}</div>
				<div><strong>{@displayValue @props.result.secondary.name}:</strong> {@props.result.secondary.value}</div>
				<div>&nbsp;</div>
				<div><strong>Helm:</strong> {@displayValue @props.result.slots.helm}</div>
				<div><strong>Shoulders:</strong> {@displayValue @props.result.slots.shoulders}</div>
				<div><strong>Chest:</strong> {@displayValue @props.result.slots.chest}</div>
				<div><strong>Gloves:</strong> {@displayValue @props.result.slots.gloves}</div>
				<div><strong>Leggings:</strong> {@displayValue @props.result.slots.leggings}</div>
				<div><strong>Boots:</strong> {@displayValue @props.result.slots.boots}</div>
				<div>&nbsp;</div>
				{
					if @props.result.slots.hasOwnProperty('weapon2')
						<div><strong>Main-hand Weapon:</strong> {@displayValue @props.result.slots.weapon1}</div>
					else
						<div><strong>Two-handed Weapon:</strong> {@displayValue @props.result.slots.weapon1}</div>
				}
				{
					if @props.result.slots.hasOwnProperty('weapon2')
						<div><strong>Off-hand Weapon:</strong> {@displayValue @props.result.slots.weapon2}</div>
				}
				<div>&nbsp;</div>
				<div><strong>Back:</strong> {@displayValue @props.result.slots.back}</div>
				<div><strong>Amulet:</strong> {@displayValue @props.result.slots.amulet}</div>
				<div><strong>Ring 1:</strong> {@displayValue @props.result.slots.ring1}</div>
				<div><strong>Ring 2:</strong> {@displayValue @props.result.slots.ring2}</div>
				<div><strong>Accessory 1:</strong> {@displayValue @props.result.slots.accessory1}</div>
				<div><strong>Accessory 2:</strong> {@displayValue @props.result.slots.accessory2}</div>
			</div>
		</div>

module.exports = Result
