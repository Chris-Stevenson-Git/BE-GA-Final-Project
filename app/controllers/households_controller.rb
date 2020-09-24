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


  #Function to add a new member to the household
  def add_member
    household = Household.find_by(id: params[:household])
    added_member = User.find_by(email: params[:email])

    #Validate that the current user ownes the household they're adding a member to
    if household.owner != current_user.id
      render json: {result: 'ERROR', message: 'You must be the owner of this household to add members'}
      return
    end

    #validate that the input email exists
    if added_member == nil
      render json: {result: 'ERROR', message: 'There is no account associated with this email'}
      return
    end

    if household.users.include?(added_member)
      render json: {result: 'ERROR', message: "#{added_member.first_name} is already a member of #{household.name}"}
      return
    end

    #If it passes validataion it will create the association
    household.users << added_member
    render json: {result: 'SUCCESS'}

  end

end
