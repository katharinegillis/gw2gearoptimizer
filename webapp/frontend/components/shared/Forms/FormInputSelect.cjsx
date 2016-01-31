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
		error: React.PropTypes.string

	render: ->
		id = @props.name + '_' + randomstring.generate(5)
		if @props.error isnt null and @props.error isnt undefined and @props.error isnt '' then errorClass = 'has-error' else errorClass = ''

		<div className="form-group #{errorClass}">
			<label htmlFor={id}>{@props.label}</label>
			<select className="form-control" name={@props.name} id={id} onChange={@props.onChange}>
				<option value="" key="">-- Select {@props.label} --</option>
				{
					for value, label of @props.options
						<option value={value} key={value}>{label}</option>
				}
			</select>
			{
				<span className="help-block">{@props.error}</span> if errorClass isnt ''
			}
		</div>

module.exports = FormInputSelect