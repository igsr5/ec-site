class ChangeDataExpirationToCard < ActiveRecord::Migration[6.0]
  def change
    change_column :cards, :expiration_date, :text
  end
end
