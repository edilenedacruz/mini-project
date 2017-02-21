class Gif < ActiveRecord::Base
  belongs_to :category
  has_many :favorite_gifs
  has_many :users, through: :favorite_gifs
  validates :title, presence: true, uniqueness: true
end
