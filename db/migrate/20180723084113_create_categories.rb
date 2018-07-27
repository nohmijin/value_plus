class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.boolean :politic
      t.boolean :society
      t.boolean :education
      t.boolean :labor
      t.boolean :foodMedi
      t.boolean :press
      t.boolean :environment
      t.boolean :right
      t.boolean :female
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
