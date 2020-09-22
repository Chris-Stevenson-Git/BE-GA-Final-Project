class UsersController < ApplicationController

  before_action :authenticate_user

  def current
    render json: {name: current_user.first_name}
    # unless current_user == nil
    #   render json: current_user.first_name
    # else
    #   render json: nil
    # end
  end

end
