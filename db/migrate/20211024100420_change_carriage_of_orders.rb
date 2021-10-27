class ChangeCarriageOfOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :carriage, :integer, default: 800, null: false
  end

  def down
    change_column :orders, :carriage, :integer, null: false
  end
end
