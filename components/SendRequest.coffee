noflo = require 'noflo'
url = require 'url'

# @runtime noflo-nodejs

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'Send request'

  options = null
  req = null
  http = null
  # Add input ports
  c.inPorts.add 'url',
    datatype: 'all'
    require: yes
  c.inPorts.add 'start',
    datatype: 'bang'
    require: yes

  # Add output ports
  c.outPorts.add 'request',
    datatype: 'object'

  c.inPorts.url.on 'data', (payload) ->
    options = payload
    if typeof options is 'string'
      options = url.parse(options)

    protocol = options.protocol

    switch protocol
      when 'http:' then http = require('http')
      when 'https:' then http = require('https')

  c.inPorts.start.on 'data', ->
    req = http.request options

    req.end ->
      c.outPorts.request.send req

  # Finally return the component instance
  c
