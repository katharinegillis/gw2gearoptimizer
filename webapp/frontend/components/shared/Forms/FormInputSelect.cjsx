# @file
# @author Katharine Cordes
# @date   1/23/16
# @brief  Renders a select input on the form.

React  = require 'react'
randomstring = require 'randomstring'

class FormInputSelect extends React.Component
	constructor: (props) ->
		super props

	@propTypes:
		label: React.PropTypes.string.isRequired
		options: React.PropTypes.object.isRequired
		onChange: React.PropTypes.func.isRequired
		name: React.PropTypes.string.isRequired

	render: ->
		id = @props.name + '_' + randomstring.generate(5)

		<div className="form-group">
			<label htmlFor={id}>{@props.label}</label>
			<select className="form-control" name={@props.name} id={id} onChange={@props.onChange}>
				<option value="" key="">-- Select {@props.label} --</option>
				{
					for value, label of @props.options
						<option value={value} key={value}>{label}</option>
				}
			</select>
		</div>

module.exports = FormInputSelect