noflo = require 'noflo'

# @runtime noflo-nodejs

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'Add headers to URL object'

  # Add input ports
  c.inPorts.add 'url',
    datatype: 'object'
    require: yes
  c.inPorts.add 'headers',
    datatype: 'string'
    default: '{}'
    require: yes

  # Add output ports
  c.outPorts.add 'out',
    datatype: 'object'

  noflo.helpers.WirePattern c,
    in: ['url', 'headers']
    out: 'out'
    forwardGroups: true
  , (data, groups, out) ->
    data.url.headers = JSON.parse(data.headers)
    out.send data.url

  # Finally return the component instance
  c
