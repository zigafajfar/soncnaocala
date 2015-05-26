class Cart < ActiveRecord::Base
	has_many :order_items
	has_one :user

	def order_price
		self.order_items.map{ |order_item| order_item.price }.sum
	end
end