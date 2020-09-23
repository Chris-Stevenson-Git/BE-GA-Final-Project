class HouseholdsController < ApplicationController

  before_action :authenticate_user

  def my_households
    render json: current_user.households.to_json(:only => [:id, :name])
  end

  def details
    h = Household.find_by(id: params[:id])
    #Render the household, include the chores and users but filter sensitive user data
    render :json => h,
      include: [
        :chores,
        :users => {
          :only => [ :first_name, :last_name, :id ]
        }]
  end

end
