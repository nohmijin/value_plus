class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :roadAdress
      t.string :sido
      t.integer :x
      t.integer :y

      t.timestamps null: false
    end
  end
end
