class Record < ActiveRecord::Base 
   belongs_to :user
    
   validates :p_name, :sex, :age, :disease, presence: true
end