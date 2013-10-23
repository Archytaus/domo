describe Location do
  before do
    @direction_mock = Minitest::Mock.new
  end

  it 'can be created with an x and y position and a direction' do
    location = Location.new(0, 0, @direction_mock)
    refute_nil location, 'expected a location to be created'
  end

  describe 'report' do
    it 'can report' do
      @location = Location.new(0, 0, @direction_mock)
      assert @location.respond_to?(:report), 'expected the location to have a report method'
    end

    it 'can report its x and y position and its direction' do
      @location = Location.new(0, 0, @direction_mock)
      @direction_mock.expect :report, 'North'

      assert_equal @location.report, '[0, 0] North'
      @direction_mock.verify
    end

    it 'can report its x and y position and its direction with a different position' do
      @location = Location.new(4, 3, @direction_mock)
      @direction_mock.expect :report, 'East'

      assert_equal @location.report, '[4, 3] East'
      @direction_mock.verify
    end
  end
end