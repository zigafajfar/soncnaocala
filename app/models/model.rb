class Model < ActiveRecord::Base
	belongs_to :brand
	has_many :order_items
	validates_presence_of :name
	validates_length_of :name, in: 3..25
	validates_presence_of :price
	validates_presence_of :description
	validates_length_of :description, in: 15..300
	validates_presence_of :image

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end