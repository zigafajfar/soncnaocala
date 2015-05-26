class OrderItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :model

	validates_presence_of :model_id
	validates_presence_of :cart_id

	def price
		model.price
	end
end
