class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  # Validations
  validates :content, presence: true
  validates :rating, presence: true
  validates :user_id, presence: true
end
