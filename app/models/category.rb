class Category < ActiveRecord::Base
	has_many :products
	belongs_to :merchant
	has_many :locationscategory
	has_many :locations, through: :locationscategory
end
