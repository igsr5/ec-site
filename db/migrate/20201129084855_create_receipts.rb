class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.integer :cart_id, null: false
      t.integer :address_id, null: false
      t.integer :card_id, null: false
      t.integer :total_price, null: false
      t.integer :total_price_tax, null: false
      t.timestamps
    end
  end
end
