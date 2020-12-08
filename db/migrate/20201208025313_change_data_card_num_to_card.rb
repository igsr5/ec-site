class ChangeDataCardNumToCard < ActiveRecord::Migration[6.0]
  def change
    change_column :cards, :card_num, :text
  end
end
