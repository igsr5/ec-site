class RemoveColumnCards < ActiveRecord::Migration[6.0]
  def change
    remove_column :cards, :name
    remove_column :cards, :card_num
    remove_column :cards, :expiration_date
    remove_column :cards, :security_code
  end
end
