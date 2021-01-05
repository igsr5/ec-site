class AddCustomerIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :customer_id, :string, null: false
  end
end
