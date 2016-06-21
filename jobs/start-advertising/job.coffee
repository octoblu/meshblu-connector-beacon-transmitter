http = require 'http'

class StartAdvertising
  constructor: ({@connector}) ->
    throw new Error 'StartAdvertising requires connector' unless @connector?

  do: (message, callback) =>
    @connector.startAdvertising callback

module.exports = StartAdvertising
