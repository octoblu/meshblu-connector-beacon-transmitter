BeaconManager = require '../src/beacon-manager'

describe 'BeaconManager', ->
  beforeEach (done) ->
    @sut = new BeaconManager
    {@Bleacon} = @sut
    @Bleacon.startAdvertising = sinon.stub()
    @Bleacon.stopAdvertising = sinon.stub()
    options =
      advertiseImmediately: true
      uuid: 'the-uuid'
      major: 'mr-major-sir'
      minor: 'a-minor'
      measuredPower: -5
    @sut.connect options, done

  it 'should call stopAdvertising', ->
    expect(@Bleacon.stopAdvertising).to.have.been.called

  it 'should call startAdvertising', ->
    expect(@Bleacon.startAdvertising).to.have.been.calledWith 'the-uuid', 'mr-major-sir', 'a-minor', -5

  describe '->startAdvertising', ->
    beforeEach (done) ->
      @sut.startAdvertising done

    it 'should call Bleacon.startAdvertising', ->
      expect(@Bleacon.startAdvertising).to.have.been.calledWith 'the-uuid', 'mr-major-sir', 'a-minor', -5

  describe '->stopAdvertising', ->
    beforeEach (done) ->
      @sut.stopAdvertising done

    it 'should call Bleacon.stopAdvertising', ->
      expect(@Bleacon.stopAdvertising).to.have.been.called
