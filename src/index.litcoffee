    request = require 'request'

    Client = (user, token, @opts = {}) ->
      throw new Error 'User can not be empty' if not user
      throw new Error 'Token can not be empty' if not token

      @api = 'https://metrics-api.librato.com/v1'
      @auth = user: user, pass: token

      @

    Client.prototype._post = (url, json, cb) ->
      request.post "#{@api}/#{url}",
        auth: @auth
        json: true
        body: json
      , cb

    Client.prototype.metricsPost = (type, key, val, opts, cb) ->
      json = {}
      json[type] = {}
      json[type][@opts.prefix + key] =
        value: val
        measure_time: Math.floor new Date().getTime() / 1000
        source: opts.source or @opts.source

      @_post "metrics", json, (err, res, body) ->
        return cb err, res.statusCode, body if cb
        throw err if err

    Client.prototype.measure = (key, val, opts, cb) ->
      @metricsPost 'gauges', key, val, opts, cb

    Client.prototype.count = (key, val, opts, cb) ->
      @metricsPost 'counters', key, val, opts, cb

    module.exports = Client

