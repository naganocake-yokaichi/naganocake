class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  # enumを定義する
   enum make_status: { impossible: 0, waiting: 1, make: 2, finish: 3 }
end
