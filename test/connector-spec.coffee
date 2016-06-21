Connector = require '../'

describe 'Connector', ->
  beforeEach (done) ->
    @sut = new Connector
    {@beacon} = @sut
    @beacon.connect = sinon.stub().yields null
    @sut.start {}, done

  afterEach (done) ->
    @sut.close done

  it 'should call beacon.connect', ->
    expect(@beacon.connect).to.have.been.calledWith {}

  describe '->isOnline', ->
    it 'should yield running true', (done) ->
      @sut.isOnline (error, response) =>
        return done error if error?
        expect(response.running).to.be.true
        done()

  describe '->onConfig', ->
    beforeEach (done) ->
      options =
        uuid: 'the-uuid'
        major: 'mr-major-sir'
        minor: 'a-minor'
        measuredPower: -5
      @sut.onConfig {options}, done

    it 'should call beacon.connect', ->
      options =
        uuid: 'the-uuid'
        major: 'mr-major-sir'
        minor: 'a-minor'
        measuredPower: -5
      expect(@beacon.connect).to.have.been.calledWith options

  describe '->startAdvertising', ->
    beforeEach (done) ->
      @beacon.startAdvertising = sinon.stub().yields null
      @sut.startAdvertising done

    it 'should call @beacon.startAdvertising', ->
      expect(@beacon.startAdvertising).to.have.been.called

  describe '->stopAdvertising', ->
    beforeEach (done) ->
      @beacon.stopAdvertising = sinon.stub().yields null
      @sut.stopAdvertising done

    it 'should call @beacon.stopAdvertising', ->
      expect(@beacon.stopAdvertising).to.have.been.called
