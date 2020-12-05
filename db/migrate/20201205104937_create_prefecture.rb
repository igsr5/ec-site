class CreatePrefecture < ActiveRecord::Migration[6.0]
  def change
    create_table :prefectures do |t|
      t.integer :delivery_area, null: false, default: 0
    end
  end
end
