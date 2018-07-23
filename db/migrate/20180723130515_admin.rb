class Admin < ActiveRecord::Migration
  def change
    add_column:users,:admin,:boolean, defalt: false
  end
end
