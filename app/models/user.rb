class User < ApplicationRecord
  #Use encrypted passwords
  has_secure_password

  # A user has many chores and has/belongs to many households
  has_many :chores
  has_and_belongs_to_many :households

end
