class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.text :address1, null: false
      t.text :address2
      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :email, null: false
    end
  end
end
