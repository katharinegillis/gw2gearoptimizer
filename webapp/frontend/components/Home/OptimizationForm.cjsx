# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Renders the optimization form, and the result.

React                   = require 'react'
FormInputSelect         = require '../shared/Forms/FormInputSelect.cjsx'
FormInputNumber         = require '../shared/Forms/FormInputNumber.cjsx'
FormInputMultiCheckbox  = require '../shared/Forms/FormInputMultiCheckbox.cjsx'
OptimizationFormActions = require '../../actions/OptimizationFormActions.coffee'
ResultStore             = require '../../stores/ResultStore.coffee'
Result                  = require './Result.cjsx'
_                       = require 'underscore'

class OptimizationForm extends React.Component
	constructor: (props) ->
		super props
		@state =
			inputs: {}
			errors: {}
			processing: false

	onFieldChange: (field, event) ->
		newState = @state
		newState.inputs[field] = event.target.value
		@setState newState

	componentDidMount: ->
		ResultStore.addChangeListener @onChange

	componentWillUnmount: ->
		ResultStore.removeChangeListener @onChange

	onChange: =>
		@setState processing: false

	onClick: =>
		if @isValid()
			OptimizationFormActions.optimize @state.inputs
			state = @state
			state.processing = true
			state.result = {}
			@setState state

	isValid: =>
		state = @state
		errors = {}
		errors.profession = 'Profession is required.' if not state.inputs.hasOwnProperty('profession') or state.inputs.profession is null or state.inputs.profession is ''
		errors.healing = 'Healing before going down is required.' if not state.inputs.hasOwnProperty('healing') or state.inputs.healing is null or state.inputs.healing is ''
		errors.primary_stat = 'Primary Stat is required.' if not state.inputs.hasOwnProperty('primary_stat') or state.inputs.primary_stat is null or state.inputs.primary_stat is ''
		errors.weapon = 'Weapon is required.' if not state.inputs.hasOwnProperty('weapon') or state.inputs.weapon is null or state.inputs.weapon is ''
		errors.defensive_category = 'Defensive Category is required.' if not state.inputs.hasOwnProperty('defensive_category') or state.inputs.defensive_category is null or state.inputs.defensive_category is ''
		errors.gear_for = 'Gear For is required.' if not state.inputs.hasOwnProperty('gear_for') or state.inputs.gear_for is null or state.inputs.gear_for is ''
		errors.stats = 'Pick at least one stat combination.' if not state.inputs.hasOwnProperty('stats') or state.inputs.stats.length is 0 or not _.reduce(state.inputs.stats, ((memo, value) -> memo or value), false)
		errors.gear_level = 'Gear Level is required.' if not state.inputs.hasOwnProperty('gear_level') or state.inputs.gear_level is null or state.inputs.gear_level is ''

		state.errors = errors
		@setState state
		Object.keys(errors).length is 0

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

		stat_options =
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
			commander: 'Commander (power, precision, toughness, concentration)'
			marauder: 'Marauder (power, precision, vitality, ferocity)'
			vigilant: 'Vigilant (power, toughness, concentration, expertise)'
			crusader: 'Crusader (power, toughness, ferocity, healing power)'
			wanderer: 'Wanderer (power, vitality, toughness, concentration)'
			viper: 'Viper (power, condition damage, precision, expertise)'
			trailblazer: 'Trailblazer (toughness, condition damage, vitality, expertise)'
			minstrel: 'Minstrel (toughness, healing power, vitality, concentration)'

		gear_level_options =
			ascended: 'Ascended'
			exotic: 'Exotic'

		<div>
			<div className="row">
				<div className="col-md-12">
					<div className="panel panel-default">
						<div className="panel-body">
							<form>
								<div className="row">
									<div className="col-md-4">
										<FormInputSelect options={profession_options} label="Profession" onChange={@onFieldChange.bind this, 'profession'} name="profession" error={if @state.errors.hasOwnProperty('profession') then @state.errors.profession else ''} />
									</div>
									<div className="col-md-4">
										<FormInputSelect options={primary_stat_options} label="Primary Stat" onChange={@onFieldChange.bind this, 'primary_stat'} name="primary_stat" error={if @state.errors.hasOwnProperty('primary_stat') then @state.errors.primary_stat else ''} />
									</div>
									<div className="col-md-4">
										<FormInputSelect options={secondary_stat_options} label="Secondary Stat" onChange={@onFieldChange.bind this, 'secondary_stat'} name="secondary_stat" />
									</div>
								</div>
								<div className="row">
									<div className="col-md-4">
										<FormInputNumber label="Healing before going down" onChange={@onFieldChange.bind this, 'healing'} name="healing" error={if @state.errors.hasOwnProperty('healing') then @state.errors.healing else ''} />
									</div>
									<div className="col-md-4">
										<FormInputSelect options={weapon_options} label="Weapon" onChange={@onFieldChange.bind this, 'weapon'} name="weapon" error={if @state.errors.hasOwnProperty('weapon') then @state.errors.weapon else ''} />
									</div>
									<div className="col-md-4">
										<FormInputSelect options={defensive_category_options} label="Defensive Category" onChange={@onFieldChange.bind this, 'defensive_category'} name="defensive_category" error={if @state.errors.hasOwnProperty('defensive_category') then @state.errors.defensive_category else ''} />
									</div>
								</div>
								<div className="row">
									<div className="col-md-4">
										<FormInputSelect options={gear_for_options} label="Gear For" onChange={@onFieldChange.bind this, 'gear_for'} name="gear_for" error={if @state.errors.hasOwnProperty('gear_for') then @state.errors.gear_for else ''} />
									</div>
									<div className="col-md-8">
										<FormInputSelect options={gear_level_options} label="Gear Level" onChange={@onFieldChange.bind this, 'gear_level'} name="gear_level" error={if @state.errors.hasOwnProperty('gear_level') then @state.errors.gear_level else ''} />
									</div>
								</div>
								<div className="row">
									<div className="col-md-12">
										<FormInputMultiCheckbox options={stat_options} label="Include the following stat combinations:" columns=2 onChange={@onFieldChange.bind this, 'stats'} name="stats" error={if @state.errors.hasOwnProperty('stats') then @state.errors.stats else ''}  />
									</div>
								</div>
							</form>
						</div>
						<div className="panel-footer">
							<div className="row">
								<div className="col-md-2 col-md-offset-8 text-right">
									<img className={if @state.processing then '' else 'hide'} src="images/ajax-loader.gif" />
								</div>
								<div className="col-md-2 text-right">
									<button type="button" className="btn btn-primary" onClick={@onClick} disabled={if @state.processing then 'disabled' else ''}>Optimize</button>
								</div>
							</div>
							<div className="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

module.exports = OptimizationForm