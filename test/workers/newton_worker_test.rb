require 'test_helper'
class NewtonWorkerTest < MiniTest::Test
  def test_perform
    # mock = MiniTest::Mock.new

    # TODO: Currently difficult because MiniTest requires an expected return value :(
    # mock.expect :update_position, nil

    NewtonWorker.new.perform

    # mock.verify
  end
end
