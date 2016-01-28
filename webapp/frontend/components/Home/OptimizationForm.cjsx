# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Renders the optimization form, and the result.

React                   = require 'react'
FormInputSelect         = require '../shared/Forms/FormInputSelect.cjsx'
FormInputNumber         = require '../shared/Forms/FormInputNumber.cjsx'
FormInputMultiCheckbox  = require '../shared/Forms/FormInputMultiCheckbox.cjsx'
OptimizationFormActions = require '../../actions/OptimizationFormActions.coffee'
OptimizationFormStore   = require '../../stores/OptimizationFormStore.coffee'
Result                  = require './Result.cjsx'

getResultState = () ->
	result: OptimizationFormStore.getResult()

class OptimizationForm extends React.Component
	constructor: (props) ->
		super props
		@state =
			inputs: {}
			result: {}

	componentDidMount: ->
		OptimizationFormStore.addChangeListener @onChange

	componentWillUnmount: ->
		OptimizationFormStore.removeChangeListener @onChange

	onFieldChange: (field, event) ->
		newState = @state
		newState.inputs[field] = event.target.value
		@setState newState

	onChange: =>
		@setState getResultState()

	onClick: =>
		OptimizationFormActions.optimize @state.inputs

	render: ->
		profession_options =
			elementalist: 'Elementalist'
			engineer: 'Engineer'
			guardian: 'Guardian'
			mesmer: 'Mesmer'
			necromancer: 'Necromancer'
			ranger: 'Ranger'
			revenant: 'Revenant'
			thief: 'Thief'
			warrior: 'Warrior'

		primary_stat_options =
			power: 'Power'
			ferocity: 'Ferocity'
			condition_damage: 'Condition Damage'
			precision: 'Precision'
			healing_power: 'Healing Power'
			concentration: 'Concentration'
			expertise: 'Expertise'

		secondary_stat_options =
			power: 'Power'
			ferocity: 'Ferocity'
			condition_damage: 'Condition Damage'
			precision: 'Precision'
			healing_power: 'Healing Power'
			concentration: 'Concentration'
			expertise: 'Expertise'

		weapon_options =
			1: "Two-handed weapon"
			2: "Main-hand and Off-hand weapons"

		defensive_category_options =
			break_on_touch: 'Break On Touch'
			fragile: 'Fragile'
			middle_ground: 'Middle Ground'
			durable: 'Durable'
			tanky: 'Tanky'
			built_to_last: 'Built To Last'
			moving_fortress: 'Moving Fortress'

		gear_for_options =
			core: 'Central Tyria'
			hot: 'Heart of Thorns'

		core_stat_options =
			berserker: 'Berserker (power, precision, ferocity)'
			zealot: 'Zealot (power, precision, healing power)'
			soldier: 'Soldier (power, toughness, vitality)'
			captain: 'Captain (power, precision, toughness)'
			valkyrie: 'Valkyrie (power, vitality, ferocity)'
			rampager: 'Rampager (precision, power, condition damage)'
			assassin: 'Assassin (precision, power, ferocity)'
			knight: 'Knight (toughness, power, precision)'
			cavalier: 'Cavalier (toughness, power, ferocity)'
			nomad: 'Nomad (toughness, vitality, healing power)'
			settler: 'Settler (toughness, condition damage, healing power)'
			sentinel: 'Sentinel (vitality, power, toughness)'
			shaman: 'Shaman (vitality, condition damage, healing power)'
			sinister: 'Sinister (condition damage, power, precision)'
			carrion: 'Carrion (condition damage, power, vitality)'
			rabid: 'Rabid (condition damage, precision, toughness)'
			dire: 'Dire (condition damage, toughness, vitality)'
			cleric: 'Cleric (healing power, power, toughness)'
			magi: 'Magi (healing power, precision, vitality)'
			apothecary: 'Apothecary (healing power, toughness, condition damage)'

		hot_stat_options =
			commander: 'Commander (power, precision, toughness, concentration)'
			marauder: 'Marauder (power, precision, vitality, ferocity)'
			vigilant: 'Vigilant (power, toughness, concentration, expertise)'
			crusader: 'Crusader (power, toughness, ferocity, healing power)'
			wanderer: 'Wanderer (power, vitality, toughness, concentration)'
			viper: 'Viper (power, condition damage, precision, expertise)'
			trailblazer: 'Trailblazer (toughness, condition damage, vitality, expertise)'
			minstrel: 'Minstrel (toughness, healing power, vitality, concentration)'

		<div>
			<div className="col-md-12">
				<div className="panel panel-default">
					<div className="panel-body">
						<form>
							<FormInputSelect options={profession_options} label="Profession" onChange={@onFieldChange.bind this, 'profession'} name="profession" />
							<FormInputNumber label="Healing before going down" onChange={@onFieldChange.bind this, 'healing'} name="healing" />
							<FormInputSelect options={primary_stat_options} label="Primary Stat" onChange={@onFieldChange.bind this, 'primary_stat'} name="primary_stat" />
							<FormInputSelect options={secondary_stat_options} label="Secondary Stat" onChange={@onFieldChange.bind this, 'secondary_stat'} name="secondary_stat" />
							<FormInputSelect options={weapon_options} label="Weapon" onChange={@onFieldChange.bind this, 'weapon'} name="weapon" />
							<FormInputSelect options={defensive_category_options} label="Defensive Category" onChange={@onFieldChange.bind this, 'defensive_category'} name="defensive_category" />
							<FormInputSelect options={gear_for_options} label="Gear For" onChange={@onFieldChange.bind this, 'gear_for'} name="gear_for" />
							<FormInputMultiCheckbox options={core_stat_options} label="Include the following Central Tyria stat combinations:" onChange={@onFieldChange.bind this, 'core_stats'} name="core_stats" />
							<FormInputMultiCheckbox options={hot_stat_options} label="Include the following Heart of Thorns stat combinations:" onChange={@onFieldChange.bind this, 'hot_stats'} name="hot_stats" />
						</form>
					</div>
					<div className="panel-footer text-right">
						<button type="button" className="btn btn-primary" onClick={@onClick}>Optimize</button>
					</div>
				</div>
			</div>
			<div className="col-md-12">
				<Result result={@state.result} />
			</div>
		</div>

module.exports = OptimizationForm