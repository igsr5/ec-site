class RemoveCardIdToReceipts < ActiveRecord::Migration[6.0]
  def change
    remove_column :receipts,:card_id
  end
end
