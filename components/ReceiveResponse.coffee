noflo = require 'noflo'

# @runtime noflo-nodejs

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'On response event'

  # Add input ports
  c.inPorts.add 'request',
    datatype: 'object'
    require: yes

  # Add output ports
  c.outPorts.add 'response',
    datatype: 'string'
  c.outPorts.add 'message',
    datatype: 'string'

  noflo.helpers.WirePattern c,
    in: 'request'
    out: ['response', 'message']
    forwardGroups: true
  , (data, groups, out) ->
    data.on 'response', (res) ->
      str = ''
      res.on 'data', (chunk) ->
        str = str + chunk
      res.on 'end', ->
        out.message.send str
        out.response.send res

  # Finally return the component instance
  c
