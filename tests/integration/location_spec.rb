describe Location do
  it 'can be created with a x, y position and a direction' do
    location = Location.create(0, 0, 'North')
    refute_nil location, 'expected a location to be created'
    assert_equal '[0, 0] North', location.report
  end
end