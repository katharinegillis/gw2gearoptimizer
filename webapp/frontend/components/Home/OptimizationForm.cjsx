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
ResultStore             = require '../../stores/ResultStore.coffee'
Result                  = require './Result.cjsx'
_                       = require 'underscore'

getFormState = () ->
	processing: false
	options: OptimizationFormStore.getOptions()

class OptimizationForm extends React.Component
	constructor: (props) ->
		super props
		@state =
			inputs: {}
			errors: {}
			options: {}
			processing: false

	onFieldChange: (field, event) ->
		newState = @state
		newState.inputs[field] = event.target.value
		@setState newState, () ->
			if (field is 'gear_level' or field is 'stats') and newState.inputs.gear_level isnt undefined and newState.inputs.gear_level isnt null and newState.inputs.gear_level isnt ''
				selected_options = []
				for stat, value of newState.inputs.stats
					selected_options.push stat if value
				OptimizationFormActions.narrowOptions newState.inputs.gear_level, selected_options

	componentDidMount: ->
		ResultStore.addChangeListener @onChange
		OptimizationFormStore.addChangeListener @onChange
		OptimizationFormActions.getOptions()

	componentWillUnmount: ->
		ResultStore.removeChangeListener @onChange
		OptimizationFormStore.removeChangeListener @onChange

	onChange: =>
		newState = getFormState()
		newState.inputs = @state.inputs
		for field, value of newState.inputs
			newState.inputs[field] = '' if typeof value is 'string' and newState.options.hasOwnProperty(field) and not newState.options[field].hasOwnProperty(value)
		@setState newState

	onClick: =>
		if @isValid()
			OptimizationFormActions.optimize @state.inputs
			state = @state
			state.processing = true
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
		<div>
			<div className="row">
				<div className="col-md-12">
					<div className="panel panel-default">
						<div className="panel-body">
							<form>
								<div className="row">
									<div className="col-md-4">
										<FormInputSelect options={@state.options.profession or {}} label="Profession" onChange={@onFieldChange.bind this, 'profession'} name="profession" error={if @state.errors.hasOwnProperty('profession') then @state.errors.profession else ''} />
									</div>
									<div className="col-md-4">
										<FormInputSelect options={@state.options.primary_stat or {}} label="Primary Stat" onChange={@onFieldChange.bind this, 'primary_stat'} name="primary_stat" error={if @state.errors.hasOwnProperty('primary_stat') then @state.errors.primary_stat else ''} />
									</div>
									<div className="col-md-4">
										<FormInputSelect options={@state.options.secondary_stat or {}} label="Secondary Stat" onChange={@onFieldChange.bind this, 'secondary_stat'} name="secondary_stat" />
									</div>
								</div>
								<div className="row">
									<div className="col-md-4">
										<FormInputNumber label="Healing before going down" onChange={@onFieldChange.bind this, 'healing'} name="healing" error={if @state.errors.hasOwnProperty('healing') then @state.errors.healing else ''} />
									</div>
									<div className="col-md-4">
										<FormInputSelect options={@state.options.weapon or {}} label="Weapon" onChange={@onFieldChange.bind this, 'weapon'} name="weapon" error={if @state.errors.hasOwnProperty('weapon') then @state.errors.weapon else ''} />
									</div>
									<div className="col-md-4">
										<FormInputSelect options={@state.options.defensive_category or {}} label="Defensive Category" onChange={@onFieldChange.bind this, 'defensive_category'} name="defensive_category" error={if @state.errors.hasOwnProperty('defensive_category') then @state.errors.defensive_category else ''} />
									</div>
								</div>
								<div className="row">
									<div className="col-md-4">
										<FormInputSelect options={@state.options.gear_for or {}} label="Gear For" onChange={@onFieldChange.bind this, 'gear_for'} name="gear_for" error={if @state.errors.hasOwnProperty('gear_for') then @state.errors.gear_for else ''} />
									</div>
									<div className="col-md-8">
										<FormInputSelect options={@state.options.gear_level or {}} label="Gear Level" onChange={@onFieldChange.bind this, 'gear_level'} name="gear_level" error={if @state.errors.hasOwnProperty('gear_level') then @state.errors.gear_level else ''} />
									</div>
								</div>
								<div className="row">
									<div className="col-md-12">
										<FormInputMultiCheckbox options={@state.options.stat or {}} label="Include the following stat combinations:" columns=2 onChange={@onFieldChange.bind this, 'stats'} name="stats" error={if @state.errors.hasOwnProperty('stats') then @state.errors.stats else ''}  />
									</div>
								</div>
								<div className="row">
									<div className="col-md-4">
										<FormInputSelect options={@state.options.armour or {}} label="Specific Headgear" onChange={@onFieldChange.bind this, 'headgear'} name="headgear" />
									</div>
									<div className="col-md-4">
										<FormInputSelect options={@state.options.armour or {}} label="Specific Shoulders" onChange={@onFieldChange.bind this, 'shoulders'} name="shoulders" />
									</div>
									<div className="col-md-4">
										<FormInputSelect options={@state.options.armour or {}} label="Specific Chest" onChange={@onFieldChange.bind this, 'chest'} name="chest" />
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