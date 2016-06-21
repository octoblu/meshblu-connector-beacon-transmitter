async   = require 'async'
Bleacon = require '@octoblu/bleacon'

class BeaconManager
  constructor: ->
    @Bleacon = Bleacon

  connect: ({@advertiseImmediately, @uuid, @major, @minor, @measuredPower}, callback) =>
    tasks = [@stopAdvertising]
    tasks.push @startAdvertising if @advertiseImmediately

    async.series tasks, callback

  startAdvertising: (callback) =>
    try
      @Bleacon.startAdvertising @uuid, @major, @minor, @measuredPower
    catch error
      return callback error
    callback()

  stopAdvertising: (callback) =>
    @Bleacon.stopAdvertising()
    callback()

module.exports = BeaconManager
