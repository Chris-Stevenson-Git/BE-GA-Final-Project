class UsersController < ApplicationController

  # before_action :authenticate_user

  def current
    render json: {name: current_user.first_name, id: current_user.id}
  end

  def create
    User.create user_params
  end

  private

  def user_params
    params.require( :user ).permit( :first_name, :last_name, :email, :password)
  end

end
