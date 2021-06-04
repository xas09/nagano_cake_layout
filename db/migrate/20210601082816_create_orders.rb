class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id, null: false
      t.string :zip_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :shipping_fee, null: false
      t.integer :payment_method, null: false
      t.integer :payment, null: false
      t.integer :status, null: false, default: 0, limit: 1
      t.timestamps
    end
  end
end
