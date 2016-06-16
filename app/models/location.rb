class Location < ActiveRecord::Base
	belongs_to :merchant
	has_many :locationscategory
	has_many :categories, through: :locationscategory

end
