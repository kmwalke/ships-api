require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  class LoggedOutTests < self
    setup do
      @user = users(:user)
    end

    test 'should not get index' do
      get users_url, as: :json
      assert_response :unauthorized
    end

    test 'should not create user' do
      post users_url, params: { user: { email: @user.email } }, as: :json
      assert_response :unauthorized
    end

    test 'should not show user' do
      get user_url(@user), as: :json
      assert_response :unauthorized
    end

    test 'should not update user' do
      patch user_url(@user), params: { user: { email: @user.email } }, as: :json
      assert_response :unauthorized
    end

    test 'should not destroy user' do
      delete user_url(@user), as: :json
      assert_response :unauthorized
    end
  end

  class UserTests < self
    setup do
      @new_user = users(:user)
      @user     = users(:user)
    end

    test 'should not get index' do
      get users_url, headers: build_header(@user), as: :json
      assert_response :unauthorized
    end

    test 'should not create user' do
      post users_url, headers: build_header(@user), params: { user: { email: @new_user.email } }, as: :json
      assert_response :unauthorized
    end

    test 'should not show user' do
      get user_url(@new_user), headers: build_header(@user), as: :json
      assert_response :unauthorized
    end

    test 'should not update user' do
      patch user_url(@new_user), headers: build_header(@user), params: { user: { email: @new_user.email } }, as: :json
      assert_response :unauthorized
    end

    test 'should not destroy user' do
      delete user_url(@new_user), headers: build_header(@user), as: :json
      assert_response :unauthorized
    end
  end

  class AdminTests < self
    setup do
      @user  = users(:user)
      @admin = users(:admin)
    end

    test 'should get index' do
      get users_url, headers: build_header(@admin), as: :json
      assert_response :success
    end

    test 'should create user' do
      params = {
        email: 'a@b.com',
        name: 'user name',
        password: 'password',
        group_id: @user.group.id
      }
      assert_difference('User.count') do
        post users_url, headers: build_header(@admin), params: params, as: :json
      end

      assert_response 201
    end

    test 'should show user' do
      get user_url(@user), headers: build_header(@admin), as: :json
      assert_response :success

      response = JSON.parse @response.body

      assert_equal @user.email, response['email']
      assert_equal @user.name, response['name']
      assert_equal @user.group.name, response['group']['name']
    end

    test 'should update user' do
      email = 'new@email.com'

      patch user_url(@user), headers: build_header(@admin), params: { email: email }, as: :json

      response = JSON.parse @response.body

      assert_equal email, response['email']
      assert_response 200
    end

    test 'should destroy user' do
      assert_difference('User.count', -1) do
        delete user_url(@user), headers: build_header(@admin), as: :json
      end

      assert_response 204
    end
  end
end
