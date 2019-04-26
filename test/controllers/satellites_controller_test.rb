require 'test_helper'

class SatellitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @satellite = satellites(:default)
  end

  test 'should get index' do
    get satellites_url, as: :json
    assert_response :success
  end

  test 'should create satellite' do
    assert_difference('Satellite.count') do
      post satellites_url, params: { satellite: { name: @satellite.name } }, as: :json
    end

    assert_response 201
  end

  test 'should show satellite' do
    get satellite_url(@satellite), as: :json
    assert_response :success
  end

  test 'should update satellite' do
    patch satellite_url(@satellite), params: { satellite: { name: @satellite.name } }, as: :json
    assert_response 200
  end

  test 'should destroy satellite' do
    assert_difference('Satellite.count', -1) do
      delete satellite_url(@satellite), as: :json
    end

    assert_response 204
  end
end
