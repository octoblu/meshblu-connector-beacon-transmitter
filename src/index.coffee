_               = require 'lodash'
{EventEmitter}  = require 'events'
debug           = require('debug')('meshblu-connector-beacon-transmitter:index')
BeaconManager   = require './beacon-manager'

class Connector extends EventEmitter
  constructor: ->
    @beacon = new BeaconManager

  isOnline: (callback) =>
    callback null, running: true

  close: (callback) =>
    debug 'on close'
    callback()

  onConfig: (device={}, callback=_.noop) =>
    { @options } = device
    debug 'on config', @options
    fields = [
      'advertiseImmediately'
      'uuid'
      'major'
      'minor'
      'measuredPower'
    ]
    config = _.pick @options, fields
    @beacon.connect config, callback

  start: (device, callback) =>
    debug 'started'
    @onConfig device, callback

  startAdvertising: (callback) =>
    @beacon.startAdvertising callback

  stopAdvertising: (callback) =>
    @beacon.stopAdvertising callback

module.exports = Connector
