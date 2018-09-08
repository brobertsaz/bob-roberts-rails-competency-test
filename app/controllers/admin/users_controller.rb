class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]
  access admin: :all

  def index
    @users = User.all
  end

  def edit
  end

  def update
    binding.pry
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, [:roles])
  end
end
