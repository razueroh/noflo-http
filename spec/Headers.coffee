noflo = require 'noflo'
chai = require 'chai' unless chai
Headers = require '../components/Headers.coffee'

describe 'Headers component', ->
  c = null
  url = null
  headers = null

  beforeEach ->
    c = Headers.getComponent()
    url = noflo.internalSocket.createSocket()
    headers = noflo.internalSocket.createSocket()
    out = noflo.internalSocket.createSocket()

    c.inPorts.url.attach url
    c.inPorts.headers.attach headers
    c.outPorts.out.attach out

  describe 'when instantiated', ->
    it 'should have a "url" inport', ->
      chai.expect(c.inPorts.url).to.be.an 'object'
    it 'should have a "headers" inport', ->
      chai.expect(c.inPorts.headers).to.be.an 'object'
    it 'should have a "out" outport', ->
      chai.expect(c.outPorts.out).to.be.an 'object'
