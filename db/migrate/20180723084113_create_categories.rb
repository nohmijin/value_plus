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
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
