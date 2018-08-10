class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :assembly, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :user_id
      t.integer :assembly_id


      t.timestamps null: false
    end
  end
end
