class CreateAssemblies < ActiveRecord::Migration
  def change
    create_table :assemblies do |t|
      t.string :title
      t.string :thumnail
      t.string :poster
      t.text :content
      t.text :purpose
      t.date :calendar
      t.string :report
      t.integer :donateGoal
      t.date :donateDeadline
      t.integer :category
      t.integer :like
      t.integer :check
      t.string :roadAddress
      t.string :specificAdd
      t.string :sido
      t.integer :user_id

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
