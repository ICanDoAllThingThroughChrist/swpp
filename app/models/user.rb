class User < ActiveRecord::Base
  has_many :orders
  has_many :tasks
  has_secure_password
  validates :username, :email, presence:

  def slug
    self.username.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
     self.all.find do |item|
       item.slug == slug
     end
   end

end