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

		<div className="form-group">
			<label>{@props.label}</label>
			{
				for value, label of @props.options
					<div className="checkbox" key={value}>
						<label className={value}><input type="checkbox" value={value} name={@props.name} onChange={@onChange.bind this, value} /> {label}</label>
					</div>
			}
		</div>

module.exports = FormInputMultiCheckbox