class User < ActiveRecord::Base
  has_secure_password
  has_many :favorite_gifs
  has_many :gifs, through: :favorite_gifs
  validates :first_name, :last_name, :email, :username, presence: true
end
