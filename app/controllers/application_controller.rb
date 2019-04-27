class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  def require_login(group = nil)
    result = authenticate_token
    result = nil if group && current_user.group.id != group.id

    result || render_unauthorized('Access denied')
  end

  def current_user
    @current_user ||= authenticate_token
  end

  def require_json
    return if request.headers['Content-Type'] == 'application/json'

    render_unauthorized 'Content-Type must be \'application/json\''
  end

  protected

  def render_unauthorized(message)
    errors = { errors: [{ detail: message }] }
    render json: errors, status: :unauthorized
  end

  private

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      User.find_by(token: token)
    end
  end
end
