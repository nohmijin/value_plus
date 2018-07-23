class CreateScraps < ActiveRecord::Migration
  def change
    create_table :scraps do |t|

      t.timestamps null: false
    end
  end
end
