class ProfileImg < ActiveRecord::Migration
  def change
    add_column:users,:profileImg,:string
  end
end
