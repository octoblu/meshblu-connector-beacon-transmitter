{job} = require '../../jobs/start-advertising'

describe 'StartAdvertising', ->
  context 'when given a valid message', ->
    beforeEach (done) ->
      @connector =
        startAdvertising: sinon.stub().yields null
      message = {}
      @sut = new job {@connector}
      @sut.do message, (@error) =>
        done()

    it 'should not error', ->
      expect(@error).not.to.exist

    it 'should call connector.startAdvertising', ->
      expect(@connector.startAdvertising).to.have.been.called
