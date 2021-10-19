class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :postcode, null: false
      t.text :address, null: false
      t.string :phone_number, null: false
      t.boolean :is_deleted, null: false, default: false
      
      t.timestamps
    end
  end
end
