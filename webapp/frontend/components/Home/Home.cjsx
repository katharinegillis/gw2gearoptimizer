# @file
# @author Katharine Cordes
# @date   1/21/16
# @brief  Renders the home page.

React            = require 'react'
OptimizationForm = require './OptimizationForm.cjsx'
BootstrapModal   = require '../shared/Bootstrap/BootstrapModal.cjsx'

class Home extends React.Component
	onClick: =>
		@refs.modal.show()

	render: ->
		<div>
			<nav className="navbar navbar-inverse navbar-fixed-top">
				<div className="container-fluid">
					<a className="navbar-brand" href="#">GW2 Gear Optimizer</a>
					<div className="collapse navbar-collapse">
						<ul className="nav navbar-nav navbar-right">
							<li><p className="navbar-text"><small>&copy; 2015 Katharine Gillis, v{process.env.VERSION}</small></p></li>
						</ul>
					</div>
				</div>
			</nav>
			<div className="content">
				<div className="row">
					<div className="col-md-12">
						<p>
							This website is a simplified gear optimization calculator for GW2. It helps you determine a combination of gear stats that will achieve the 
							survivability you want, while optimizing your selected offensive stats.
						</p>
						<p><button type="button" className="btn btn-info more-info" onClick={@onClick}>More Information</button></p>
						<BootstrapModal ref="modal" title="More Information">
							<p>
								This uses a genetic algorithm to generate a good gear set that fits all of the conditions you set. The main thing to note about this is that
								we are searching a very large set of solutions - beyond billions - to find a gear set that fits your conditions. Because the set of solutions
								is so huge, we cannot quickly (or even slowly!) find the best solution. A genetic algorithm uses a process similar to natural selection in evolution
								to find a "near-optimal" solution. If you run the optimization a second time, with the same parameters, you may get a slightly different solution than
								your first run. Both are good solutions.
							</p>
							<p>
								The parameters are as follows:
							</p>
							<dl>
								<dt>Profession:</dt>
								<dd>Your character's profession.</dd>
								<dt>Primary Stat:</dt>
								<dd>The primary stat you want to gear for, such as your primary offensive stat.</dd>
								<dt>Secondary Stat:</dt>
								<dd>The secondary stat you want to gear for.</dd>
								<dt>Healing before going down:</dt>
								<dd>The amount of healing you do for yourself before you go down. On average, 2x the healing your healing skill does.</dd>
								<dt>Weapon:</dt>
								<dd>Whether you use two one-handed weapons or one two-handed weapon.</dd>
								<dt>Defensive Category:</dt>
								<dd>How durable you want to be. Break On Touch has very little survivability, Moving Fortress is as high survivability as you can get.</dd>
								<dt>Gear For:</dt>
								<dd>Whether you want to gear for Central Tyria or Heart of Thorns. Heart of Thorns uses more condition-based attacks, so a higher vitality is important.</dd>
								<dt>Gear Level:</dt>
								<dd>Optimize using values for Exotic gear or Ascended gear. The stat combinations available for each type of gear also changes for exotic or ascended gear.</dd>
								<dt>Include the following stat combinations:</dt>
								<dd>Pick the stat combinations you want the optimizer to consider. It is a good idea to only pick power based ones if you are going for a power build, for
								example. This also allows you to exclude stat combinations you deem too expensive to get, or too problematic to get.</dd>
							</dl>
						</BootstrapModal>
					</div>
				</div>
				<div className="row">
					<div className="col-md-12">
						<OptimizationForm />
					</div>
				</div>
			</div>
		</div>

module.exports = Home