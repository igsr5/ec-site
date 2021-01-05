class AddTokenToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :token, :string, null: false
  end
end
