require 'test_helper'

class SatellitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @satellite = satellites(:default)
    @user      = users(:user)
  end

  class UserTests < self
    test 'should get index' do
      get satellites_url, headers: build_header(@user), as: :json
      assert_response :success
    end

    test 'should create satellite' do
      assert_difference('Satellite.count') do
        post satellites_url, headers: build_header(@user), params: { satellite: { name: @satellite.name } }, as: :json
      end

      assert_response 201
    end

    test 'should show satellite' do
      get satellite_url(@satellite), headers: build_header(@user), as: :json
      assert_response :success

      response = JSON.parse @response.body

      assert_equal @satellite.name, response['name']
      assert_equal @satellite.pos_x, response['pos_x']
      assert_equal @satellite.pos_y, response['pos_y']
      assert_equal @satellite.pos_y, response['pos_y']
      assert_equal @satellite.vel_x, response['vel_x']
      assert_equal @satellite.vel_y, response['vel_y']
      assert_equal @satellite.vel_z, response['vel_z']
      assert_equal @satellite.thrust_x, response['thrust_x']
      assert_equal @satellite.thrust_y, response['thrust_y']
      assert_equal @satellite.thrust_z, response['thrust_z']
      # assert_equal @satellite.last_updated, response['last_updated']
    end

    test 'should update satellite' do
      patch(
        satellite_url(@satellite),
        headers: build_header(@user),
        params: { satellite: { name: @satellite.name } }, as: :json
      )
      assert_response 200
    end

    test 'should destroy satellite' do
      assert_difference('Satellite.count', -1) do
        delete satellite_url(@satellite), headers: build_header(@user), as: :json
      end

      assert_response 204
    end
  end
end
