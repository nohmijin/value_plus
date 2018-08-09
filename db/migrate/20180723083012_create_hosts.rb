class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :profileImg
      t.string :email
      t.text :intro
      t.references :assembly, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
