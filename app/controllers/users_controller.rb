class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action do
    require_login(Group.admin)
  end
  before_action :require_json

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    @user.password = params[:password]

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params) || params[:password] && @user.update(password: params[:password])
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :group_id, :email, :password)
  end
end
