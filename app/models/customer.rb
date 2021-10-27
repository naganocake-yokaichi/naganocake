class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :last_name, :first_name, :email, :phone_number, presence: true
  validates :last_name_kana, :first_name_kana,presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :postcode, length: {is: 7}, numericality:{ only_integer: true }
  validates :phone_number, numericality:{ only_integer: true }
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
