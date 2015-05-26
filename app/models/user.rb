class User < ActiveRecord::Base
	belongs_to :cart

	validates_presence_of :name
	validates_presence_of :last_name
	validates_presence_of :email
	validates_presence_of :address
	validates_presence_of :cart_id
	validates_format_of :email, with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/

	def full_name
		"#{name} #{last_name}"
	end

end