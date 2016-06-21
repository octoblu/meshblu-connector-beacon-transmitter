{job} = require '../../jobs/stop-advertising'

describe 'StopAdvertising', ->
  context 'when given a valid message', ->
    beforeEach (done) ->
      @connector =
        stopAdvertising: sinon.stub().yields null
      message = {}
      @sut = new job {@connector}
      @sut.do message, (@error) =>
        done()

    it 'should not error', ->
      expect(@error).not.to.exist

    it 'should call connector.stopAdvertising', ->
      expect(@connector.stopAdvertising).to.have.been.called
