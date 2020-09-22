class Household < ApplicationRecord

  #A household has many chores and many users
  has_many :chores
  has_and_belongs_to_many :users
end
