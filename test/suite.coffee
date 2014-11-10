assert = require 'assert'

LibratoClient = require '../src'
client = null

beforeEach ->
  user = process.env.LIBRATO_USER
  pass = process.env.LIBRATO_TOKEN
  client = new LibratoClient user, pass, prefix: 'node.'

describe 'Unit tests', ->
  describe 'metrics', ->
    describe '#metricsPost()', ->
      it 'should send propper body', (done) ->
        client._post = (url, json, cb) ->
          assert.equal url, 'metrics'
          assert.equal typeof json.foo['node.test'], 'object'
          assert.equal json.foo['node.test'].value, 1337
          assert.equal typeof json.foo['node.test'].measure_time, 'number'
          assert.equal typeof json.foo['node.test'].source, 'undefined'

          cb undefined, statusCode: 200, {}

        client.metricsPost 'foo', 'test', 1337, {}, (err, status, body) ->
          assert.ifError err
          assert.equal status, 200
          assert.deepEqual body, {}

          done()

