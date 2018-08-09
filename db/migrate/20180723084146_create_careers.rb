class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.string :content
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
