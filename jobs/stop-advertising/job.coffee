http = require 'http'

class StopAdvertising
  constructor: ({@connector}) ->
    throw new Error 'StopAdvertising requires connector' unless @connector?

  do: (message, callback) =>
    @connector.stopAdvertising callback

module.exports = StopAdvertising
