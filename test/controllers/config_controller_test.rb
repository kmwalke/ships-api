require 'test_helper'

class ConfigControllerTest < ActionDispatch::IntegrationTest
  class LoggedOutTests < self
    test 'should not get index' do
      get config_url, as: :json
      assert_response :unauthorized
    end
  end

  class UserTests < self
    setup do
      @user = users(:user)
    end

    test 'should get index' do
      get config_url, headers: build_header(@user), as: :json
      assert_response :success
    end
  end
end
