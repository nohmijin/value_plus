class Matching < ActiveRecord::Migration
  def change
    add_column:users,:matching,:integer
  end
end
