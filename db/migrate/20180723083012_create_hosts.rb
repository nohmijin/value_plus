class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :profieImg
      t.string :email
      t.text :intro

      t.timestamps null: false
    end
  end
end
