class User < ActiveRecord::Base
	has_secure_password

	has_many :wishes, :dependent => :destroy
	has_many :products, :through => :wishes

	validates_uniqueness_of :email
end
