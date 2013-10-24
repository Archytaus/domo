describe Location do
  before do
    @direction_mock = Minitest::Mock.new
    @position_mock = Minitest::Mock.new
  end

  it 'can be created with a position and a direction' do
    location = Location.new(@position_mock, @direction_mock)
    refute_nil location, 'expected a location to be created'
  end

  describe 'report' do
    it 'can report' do
      @location = Location.new(@position_mock, @direction_mock)
      assert @location.respond_to?(:report), 'expected the location to have a report method'
    end

    it 'can report its x and y position and its direction' do
      @location = Location.new(@position_mock, @direction_mock)
      @position_mock.expect :report, '[0, 0]'
      @direction_mock.expect :report, 'North'

      assert_equal @location.report, '[0, 0] North'
      @direction_mock.verify
      @position_mock.verify
    end

    it 'can report its x and y position and its direction with a different position' do
      @location = Location.new(@position_mock, @direction_mock)
      @position_mock.expect :report, '[4, 3]'
      @direction_mock.expect :report, 'East'

      assert_equal @location.report, '[4, 3] East'
      @direction_mock.verify
      @position_mock.verify
    end
  end

  describe 'move forward' do
    it 'can move forward' do
      @location = Location.new(@position_mock, @direction_mock)
      assert @location.respond_to?(:move_forward), 'expected the location to have a move_forward method'
    end

    it 'moves using the direction point' do
      @location = Location.new(@position_mock, @direction_mock)

      @direction_position_mock = Minitest::Mock.new
      @new_position_mock = Minitest::Mock.new
      @position_mock.expect :+, @new_position_mock, [@direction_position_mock]
      @direction_mock.expect :to_position, @direction_position_mock

      @location.move_forward
      
      @direction_mock.verify
      @position_mock.verify
    end
  end

  describe 'rotate left' do
    it 'can move rotate left' do
      @location = Location.new(@position_mock, @direction_mock)
      assert @location.respond_to?(:rotate_left), 'expected the location to have a rotate_left method'
    end

    it 'rotates to the left' do
      @location = Location.new(@position_mock, @direction_mock)

      @direction_mock.expect :rotate_left, nil

      @location.rotate_left

      @direction_mock.verify
    end
  end

    describe 'rotate right' do
    it 'can move rotate right' do
      @location = Location.new(@position_mock, @direction_mock)
      assert @location.respond_to?(:rotate_right), 'expected the location to have a rotate_right method'
    end

    it 'rotates to the right' do
      @location = Location.new(@position_mock, @direction_mock)

      @direction_mock.expect :rotate_right, nil

      @location.rotate_right

      @direction_mock.verify
    end
  end
end