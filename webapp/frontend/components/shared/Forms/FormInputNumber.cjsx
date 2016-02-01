# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Renders a text input on the form.

React  = require 'react'

class FormInputNumber extends React.Component
	constructor: (props) ->
		super props

	@propTypes:
		label: React.PropTypes.string.isRequired
		onChange: React.PropTypes.func.isRequired
		name: React.PropTypes.string.isRequired

	render: ->
		randomString = []
		possible = 'abcdefghijklmnopqrstuvwxyz0123456789'
		randomString.push possible.charAt(Math.random() * possible.length) for i in [0..5]
		id = @props.name + '_' + randomString.join('')
		if @props.error isnt null and @props.error isnt undefined and @props.error isnt '' then errorClass = 'has-error' else errorClass = ''

		<div className="form-group #{errorClass}">
			<label htmlFor={id}>{@props.label}</label>
			<input type="number" className="form-control" name={@props.name} id={id} onChange={@props.onChange} />
			{
				<span className="help-block">{@props.error}</span> if errorClass isnt ''
			}
		</div>

module.exports = FormInputNumber