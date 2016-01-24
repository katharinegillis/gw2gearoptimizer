# @file
# @author Katharine Cordes
# @date   1/21/16
# @brief  Renders the home page.

React            = require 'react'
OptimizationForm = require './OptimizationForm.cjsx'

class Home extends React.Component
	render: ->
		<div>
			<div className="row">
				<div className="col-md-12">
					<h1>GW2 Gear Optimization</h1>
					<p>
						This website is a simplified gear optimization calculator for GW2. It helps you determine a combination of gear stats that will achieve the 
						survivability you want, while optimizing your selected offensive stats.
					</p>
				</div>
			</div>
			<div className="row">
				<div className="col-md-12">
					<OptimizationForm />
				</div>
			</div>
		</div>

module.exports = Home