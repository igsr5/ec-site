class AddFamilyNameGivenName < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :family_name, :text
    add_column :users, :given_name, :text
  end
end
