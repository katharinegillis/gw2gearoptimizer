# @file
# @author Katharine Cordes
# @date   1/21/16
# @brief  Renders the main app.

React = require 'react'

class App extends React.Component
	render: ->
		<div className="container">
			{this.props.children}
		</div>

module.exports = App