class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  validates :is_active, presence: true
  
  def add_tax_price
    (self.price * 1.1).floor
  end
end
