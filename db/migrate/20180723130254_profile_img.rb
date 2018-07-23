class ProfileImg < ActiveRecord::Migration
  def change
    add_column:users,:profileImg,:integer, defalt: false
  end
end
