class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :order_id
      t.string  :email
      t.string  :address
      t.string  :name
      t.string  :cc_number
      t.string  :cc_expiration
      t.string  :cvv
      t.string  :zipcode

      t.timestamps
    end
  end
end
