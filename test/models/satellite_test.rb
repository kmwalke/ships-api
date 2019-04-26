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
    assert_kind_of DateTime, sat.last_updated
  end
end
