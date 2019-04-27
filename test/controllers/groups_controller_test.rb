require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  class LoggedOutTests < self
    setup do
      @group = groups(:user)
    end

    test 'should not get index' do
      get groups_url, as: :json
      assert_response :unauthorized
    end

    test 'should not create group' do
      post groups_url, params: { name: @group.name }, as: :json
      assert_response :unauthorized
    end

    test 'should not show group' do
      get group_url(@group), as: :json
      assert_response :unauthorized
    end

    test 'should not update group' do
      patch group_url(@group), params: { name: 'name' }, as: :json
      assert_response :unauthorized
    end

    test 'should not destroy group' do
      delete group_url(@group), as: :json
      assert_response :unauthorized
    end
  end

  class UserTests < self
    setup do
      @user  = users(:user)
      @group = groups(:user)
    end

    test 'should not get index' do
      get groups_url, headers: build_header(@user), as: :json
      assert_response :unauthorized
    end

    test 'should not create group' do
      post groups_url, headers: build_header(@user), params: { name: 'name' }, as: :json
      assert_response :unauthorized
    end

    test 'should not show group' do
      get group_url(@group), headers: build_header(@user), as: :json
      assert_response :unauthorized
    end

    test 'should not update group' do
      patch group_url(@group), headers: build_header(@user), params: { name: 'name' }, as: :json
      assert_response :unauthorized
    end

    test 'should not destroy group' do
      delete group_url(@group), headers: build_header(@user), as: :json
      assert_response :unauthorized
    end
  end

  class AdminTests < self
    setup do
      @admin = users(:admin)
      @group = groups(:admin)
    end

    test 'should get index' do
      get groups_url, headers: build_header(@admin), as: :json
      assert_response :success
    end

    test 'should not create duplicate group' do
      params = {
        name: @group.name,
        access_level: @group.access_level
      }

      post groups_url, headers: build_header(@admin), params: params, as: :json

      assert_response 422
    end

    test 'should create group' do
      Group.user.destroy

      params = {
        name: 'user',
        access_level: 1
      }
      assert_difference('Group.count') do
        post groups_url, headers: build_header(@admin), params: params, as: :json
      end

      assert_response 201
    end

    test 'should show group' do
      get group_url(@group), headers: build_header(@admin), as: :json
      assert_response :success

      response = JSON.parse @response.body

      assert_equal @group.name, response['name']
      assert_equal @group.access_level, response['access_level']
    end

    test 'should update group' do
      access_level = 10

      patch group_url(@group), headers: build_header(@admin), params: { access_level: access_level }, as: :json

      response = JSON.parse @response.body

      assert_equal access_level, response['access_level']
      assert_response 200
    end

    test 'should destroy group' do
      assert_difference('Group.count', -1) do
        delete group_url(@group), headers: build_header(@admin), as: :json
      end

      assert_response 204
    end
  end
end
