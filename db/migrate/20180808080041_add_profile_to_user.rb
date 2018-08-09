class AddProfileToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile, :string, defalt: false
  end
end
