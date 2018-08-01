class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :roadAddress
      t.string :sido
      t.integer :x
      t.integer :y
      t.integer :assembly_id

      t.timestamps null: false
    end
  end
end
