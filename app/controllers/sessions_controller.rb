class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create], raise: false
  before_action :require_json

  def create
    user = User.valid_login?(params[:email], params[:password])
    if user
      allow_token_to_be_used_only_once_for user
      send_auth_token_for_valid_login_of user
    else
      render_unauthorized 'Error with your login or password.'
    end
  end

  def new_user
    user = User.new(
        {
            email: params[:email],
            name: params[:name],
            group_id: params[:group_id],
            password: params[:password],
        }
    )

    if user.save!
      render json: {email: user.email, name: user.name}
    else
      render_unauthorized user.errors
    end
  end

  def destroy
    logout
    head :ok
  end

  private

  def send_auth_token_for_valid_login_of(user)
    render json: {token: user.token, user_id: user.id}
  end

  def allow_token_to_be_used_only_once_for(user)
    user.regenerate_token
  end

  def logout
    current_user.invalidate_token
  end
end