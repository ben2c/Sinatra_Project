class Users < ActiveRecord::Base 
   has_many :records
   
  validates :email, :password, presence: true
  validates :email, uniqueness: true
end