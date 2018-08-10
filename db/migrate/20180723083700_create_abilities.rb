class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.boolean :plan
      t.boolean :mc
      t.boolean :video
      t.boolean :design
      t.boolean :sns
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
