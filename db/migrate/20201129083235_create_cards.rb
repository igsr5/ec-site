class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.integer :card_num, null: false
      t.datetime :expiration_date, null: false
      t.integer :security_code, null: false
    end
  end
end
