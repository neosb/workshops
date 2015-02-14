class Category < ActiveRecord::Base
  has_many :products

  # Validate uniqueness of name
  validates :name, uniqueness: true
end
