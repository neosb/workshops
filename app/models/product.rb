class Product < ActiveRecord::Base
  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, format: { :with => /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :category
  belongs_to :user
  has_many :reviews

  # Calculate average rating
  def average_rating
    count = self.reviews.size
    total = 0
    self.reviews.each do |review|
      total += review.rating
    end
    if total == 0 || count == 0
      0
    else
      total.to_f / count.to_f
    end
  end
end
