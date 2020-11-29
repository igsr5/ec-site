class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.integer :product_id
      t.integer :product_count
      t.integer :cart_id
      t.timestamps
    end
  end
end
