class Cards < ActiveRecord::Migration[6.0]
  def change
    drop_table :cards
  end
end
