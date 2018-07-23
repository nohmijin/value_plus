class CreateAssemblies < ActiveRecord::Migration
  def change
    create_table :assemblies do |t|
      t.string :title
      t.string :thumnailImg
      t.string :posterImg
      t.text :content
      t.text :purpose
      t.date :calender
      t.string :reportImg
      t.integer :donateGoal
      t.date :donateDeadline
      t.integer :category
      t.integer :like

      t.timestamps null: false
    end
  end
end
