// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "deps/phoenix_html/web/static/js/phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import React from "react";

let HelloWorld = React.createClass({
  render: function() {
    return (<h2>Our engineers are hard at work on OpenFn v2! Email admin@openfn.org to start contributing, or head back to www.openfn.org.</h2>);
  }
})

React.render(
  <HelloWorld />,
  document.getElementsByClassName('container')[0]
);