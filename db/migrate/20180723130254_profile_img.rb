class ProfileImg < ActiveRecord::Migration
  def change
    remove_column:users,:profileImg,:integer, defalt: false
  end
end
