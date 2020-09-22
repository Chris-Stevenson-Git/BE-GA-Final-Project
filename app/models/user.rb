class User < ApplicationRecord
  #Use encrypted passwords
  has_secure_password

  
end
