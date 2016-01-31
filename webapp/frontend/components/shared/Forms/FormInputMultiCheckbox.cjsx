# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Renders a select input on the form.

React  = require 'react'
randomstring = require 'randomstring'

class FormInputMultiCheckbox extends React.Component
	constructor: (props) ->
		super props

		@state = {}
		for value, label of @props.options
			@state[value] = false

	@propTypes:
		label: React.PropTypes.string.isRequired
		options: React.PropTypes.object.isRequired
		onChange: React.PropTypes.func.isRequired
		name: React.PropTypes.string.isRequired
		columns: React.PropTypes.number

	@defaultProps:
		columns: 1

	onChange: (field, event) ->
		newState = {}
		newState[field] = event.target.checked
		@setState newState, () ->
			newEvent =
				target:
					value: @state
			@props.onChange newEvent

	render: ->
		id = @props.name + '_' + randomstring.generate(5)
		if @props.error isnt null and @props.error isnt undefined and @props.error isnt '' then errorClass = 'has-error' else errorClass = ''
		switch @props.columns
			when 2 then column_width = 6
			when 3 then column_width = 4
			else column_width = 12

		<div className="form-group multicheckbox #{errorClass}">
			<div className="col-md-12">
				<label>{@props.label}</label>
				{
					<span className="help-block">{@props.error}</span> if errorClass isnt ''
				}
			</div>
			{
				for value, label of @props.options
					<div className="col-md-#{column_width}" key={value}>
						<div className="checkbox">
							<label className={value}><input type="checkbox" value={value} name={@props.name} onChange={@onChange.bind this, value} /> {label}</label>
						</div>
					</div>
			}
		</div>

module.exports = FormInputMultiCheckbox