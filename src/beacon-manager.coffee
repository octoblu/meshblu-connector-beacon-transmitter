async   = require 'async'
try
  if process.env.SKIP_REQUIRE_BLEACON == 'true'
    Bleacon = {}
  else
    Bleacon = require '@octoblu/bleacon'
catch error
  console.error error

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
