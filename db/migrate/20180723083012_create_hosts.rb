class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :profileImg
      t.string :email
      t.text :intro
      t.integer :assembly_id

      t.timestamps null: false
    end
  end
end
