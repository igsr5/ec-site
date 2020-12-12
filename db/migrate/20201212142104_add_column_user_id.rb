class AddColumnUserId < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :user_id, :integer
    add_column :carts, :user_id, :integer
    add_column :cards, :user_id, :integer
    add_column :receipts, :user_id, :integer
  end
end
