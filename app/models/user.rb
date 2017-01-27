class User < ActiveRecord::Base
has_secure_password
has_and_belongs_to_many :post
has_many :comment, :through => :post

validates 	:first_name, :last_name,:email,:username,:presence => true
validates 	:first_name, :last_name,:email, :length => {:maximum =>255},:uniqueness => true
EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
validates_format_of :email, :with => EMAIL_REGEX

scope :sorted, lambda { order("last_name ASC, first_name ASC")}
def name 
      "#{first_name} #{last_name}"
end

end
