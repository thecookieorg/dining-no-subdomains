class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :merchant
  has_many :sizes, dependent: :destroy
  accepts_nested_attributes_for :sizes, allow_destroy: true

  def sizes_form_for
    collection = sizes.where(product_id: id)
    collection.any? ? collection : sizes.build
  end
end
