class Merchant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :categories, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :sizes, dependent: :destroy
  has_many :product_taxes, dependent: :destroy
  has_many :location_hours, dependent: :destroy
  has_many :hours, dependent: :destroy
end
