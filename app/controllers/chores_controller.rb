class ChoresController < ApplicationController

  before_action :authenticate_user

  def add_chore
    household = Household.find_by(id: params[:household])
    name = params[:name]
    location = params[:location]
    est_time = params[:est_time]
    frequency = params[:frequency]
    user = params[:user]

    # Validate all fields have been filled in
    if name == '' || location == '' || est_time == '' || frequency == '' || user == ''
      render json: {result: 'ERROR', message: 'Please ensure all fields have been filled in.'}
      return
    end

    #Auto assign chores based on who has the least
    if user == 'Auto Assign'
      #Loop through each member of the household and find who has the least amount of time spent on chores.
      users_time = {}
      household.users.each do |u|
        time = 0
        u.chores.each do |chore|
          time += chore.est_time
        end
        users_time[u.id] = time
      end
      sucker = users_time.sort_by{|k,v| v}.first
      user = sucker[0]
    end

    Chore.create(
      name: name,
      location: location,
      est_time: est_time.to_i,
      frequency: frequency.to_i,
      user_id: user,
      completed: false,
      household_id: household.id
    )
    render json: {result: 'SUCCESS'}


  end

  def delete
    chores = params[:chores]

    chores.each do |chore|
      Chore.find_by(id: chore).destroy
    end

  end #delete

  def complete
    chores = params[:chores]

    chores.each do |chore|
      Chore.find_by(id: chore).update(completed: true)
    end

  end #Complete

end
