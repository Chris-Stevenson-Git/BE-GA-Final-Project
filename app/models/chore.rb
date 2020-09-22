class Chore < ApplicationRecord

  #A chore belongs to a use and to a household. Optional is true as a chore may be created without a user attached at first
  belongs_to :user, optional: true
  belongs_to :household, optional: true
end
