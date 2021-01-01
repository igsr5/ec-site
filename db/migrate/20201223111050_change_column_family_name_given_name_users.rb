class ChangeColumnFamilyNameGivenNameUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :family_name, false
    change_column_null :users, :given_name, false
  end
end
