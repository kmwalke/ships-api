ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    def get_active_token(user = nil)
      user ||= User.where(group: Group.user).first

      post(
        '/login',
        params: { email: user.email, password: '123456', format: :json }.to_json,
        headers: { 'Content-Type': 'application/json' }
      )

      JSON.decode(@response.body)['token']
    end

    def build_logged_out_header
      { 'Content-Type': 'application/json', Page: 'test page' }
    end

    def build_header(user)
      user.token = get_active_token(user) unless user.token
      { 'Content-Type': 'application/json', Page: 'test page', Authorization: 'Bearer ' + user.token }
    end
  end
end
