class Users < ActiveRecord::Base 
   has_secure_password
   has_many :records
   
  validates :email, :password, presence: true
  validates :email, uniqueness: true

    def slug
      username.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
      Users.all.find{|user| user.slug == slug}
    end
end