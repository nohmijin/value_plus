class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :poster

      t.timestamps null: false
    end
  end
end
