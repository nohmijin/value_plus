class Introduce < ActiveRecord::Migration
  def change
    add_column:users,:introduce,:text, defalt: false
  end
end
