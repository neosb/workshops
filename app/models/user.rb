class User < ActiveRecord::Base

  attr_accessor :firstname, :lastname
  validates :lastname, presence: true 
  validates :firstname, presence: true
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :products

  def admin?
    @admin
  end
end
