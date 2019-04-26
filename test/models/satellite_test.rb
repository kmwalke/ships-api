require 'test_helper'

class SatelliteTest < ActiveSupport::TestCase
  test 'name is required' do
    sat = Satellite.new

    assert_not sat.save
  end

  test 'name cannot be blank' do
    sat = Satellite.new

    sat.name = ''

    assert_not sat.save
  end

  test 'creates with defaults' do
    sat = Satellite.new

    sat.name = 'Sat'

    assert sat.save

    assert_equal 0, sat.pos_x
    assert_equal 0, sat.pos_y
    assert_equal 0, sat.pos_z
    assert_equal 0, sat.vel_x
    assert_equal 0, sat.vel_y
    assert_equal 0, sat.vel_z
    assert_kind_of Time, sat.last_updated
  end

  test 'update_position' do
    sat = Satellite.new

    sat.vel_x        = 1
    sat.vel_y        = 2
    sat.vel_z        = -1
    sat.last_updated = 10.minutes.ago

    sat.save

    sat.update_position

    assert_equal sat.pos_x, 600
    assert_equal sat.pos_y, 1200
    assert_equal sat.pos_z, -600
  end
end
