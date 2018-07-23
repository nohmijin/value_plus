class Matching < ActiveRecord::Migration
  def change
    add_column:users,:matching,:boolean, defalt: false
  end
end
