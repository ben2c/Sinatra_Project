class Record < ActiveRecord::Base 
   belongs_to :users
    
   validates :p_name, :sex, :age, :disease, presence: true
end