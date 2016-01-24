# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Renders a text input on the form.

React  = require 'react'
randomstring = require 'randomstring'

class FormInputNumber extends React.Component
	constructor: (props) ->
		super props

	@propTypes:
		label: React.PropTypes.string.isRequired
		onChange: React.PropTypes.func.isRequired
		name: React.PropTypes.string.isRequired

	render: ->
		id = @props.name + '_' + randomstring.generate(5)

		<div className="form-group">
			<label htmlFor={id}>{@props.label}</label>
			<input type="number" className="form-control" name={@props.name} id={id} onChange={@props.onChange} />
		</div>

module.exports = FormInputNumber