class User < ActiveRecord::Base
  validates :name, 
            presence: true, 
            length: {maximum: 10}
  validates :email, presence: true 
  
  has_secure_password
end
