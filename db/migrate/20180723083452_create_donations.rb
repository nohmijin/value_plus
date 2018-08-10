class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :donateUser
      t.references :assembly, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
