class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :photo
      t.integer :user_id
      t.integer :stock

      t.timestamps
    end
  end
end
