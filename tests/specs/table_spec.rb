describe Table do
  before do
    @max_position_mock = Minitest::Mock.new
    @table = Table.new(@max_position_mock)
  end

  it 'can be created' do
    refute_nil @table
    assert_equal Table.current, @table
  end

  it 'can add dirt' do
    @dirt_position_mock = Minitest::Mock.new
    @table.place_dirt([@dirt_position_mock])
  end

  describe 'With Dirt' do
    before do
      @dirt_mock = Minitest::Mock.new
      @table.dirts << @dirt_mock

      @dirt_position_mock = Minitest::Mock.new
      @dirt_mock.expect :position, @dirt_position_mock
    end

    it 'can check if there is dirt at a position' do
      @dirt_position_mock.expect :==, true, [@dirt_position_mock]
      @dirt_mock.expect :nil?, false

      assert @table.has_dirt_at?(@dirt_position_mock)

      @dirt_mock.expect :position, @dirt_position_mock
      @dirt_position_mock.expect :==, false, [@dirt_position_mock]
      @dirt_mock.expect :nil?, true

      refute @table.has_dirt_at?(@dirt_position_mock)
    end

    it 'can clean dirt at a position' do
      @dirt_position_mock.expect :==, true, [@dirt_position_mock]
      @dirt_mock.expect :nil?, false

      @table.clean_at(@dirt_position_mock)

      refute @table.dirts.include?(@dirt_mock)
    end
  end
end