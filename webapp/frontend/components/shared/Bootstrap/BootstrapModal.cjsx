# @file
# @author Katharine Cordes
# @date   1/30/15
# @brief  Renders a bootstrap modal.

React             = require 'react'
$ = window.jQuery = require 'jquery'
bootstrap         = require 'bootstrap'

class BootstrapModal extends React.Component
	@propTypes:
		title: React.PropTypes.string.isRequired

	componentDidMount: =>
		$(@refs.modal).modal
			backdrop: 'static'
			show: false

	componentWillUnmount: =>
		$(@refs.modal).off()

	show: =>
		$(@refs.modal).modal 'show'

	hide: =>
		$(@refs.modal).modal 'hide'

	render: ->
		<div ref="modal" className="modal fade" tabIndex="-1" role="dialog">
			<div className="modal-dialog modal-lg">
				<div className="modal-content">
					<div className="modal-header bg-primary">
						<button type="button" className="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 className="modal-title">{@props.title}</h4>
					</div>
					<div className="modal-body">
						{@props.children}
					</div>
					<div className="modal-footer">
						<button type="button" className="btn btn-primary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

module.exports = BootstrapModal