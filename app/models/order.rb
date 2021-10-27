class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true

  # enumを定義する
  enum pay_method: { credit_card: 0, transfer: 1 }
  enum status: { pay_waiting: 0, confirmation: 1, make: 2, ready: 3, sent: 4 }
end
