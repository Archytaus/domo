describe Location do
  before do
    @direction_mock = Minitest::Mock.new
  end

  it 'can be created with an x and y position and a direction' do
    location = Location.new(0, 0, @direction_mock)
    refute_nil location, 'expected a location to be created'
  end
end