class Game < ApplicationRecord
  has_many :purchases
  has_many :users, through: :purchases

  validates :title, {presence: true , length: {in: 10..50}, uniqueness: true}
  validates :description, {presence: true , length: {minimum: 30}}
  validates :image_url, {presence: true}

  def self.search(search)
    where("title LIKE ?","%#{search}%")
  end
end
