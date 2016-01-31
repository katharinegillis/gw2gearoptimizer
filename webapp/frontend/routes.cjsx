# @file
# @author Katharine Cordes
# @date   1/21/16
# @brief  Defines the routes for the front end.

React      = require 'react'
Route      = require('react-router').Route
IndexRoute = require('react-router').IndexRoute
App        = require './components/App.cjsx'
Home       = require './components/Home/Home.cjsx'

module.exports =
	<Route path='/' component={App}>
		<IndexRoute component={Home} />
	</Route>