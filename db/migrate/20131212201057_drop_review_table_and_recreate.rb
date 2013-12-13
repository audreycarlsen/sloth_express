class DropReviewTableAndRecreate < ActiveRecord::Migration
  def change
  	drop_table :reviews

  	create_table :reviews do |t|
  		t.string :title
  		t.string :author
  		t.text :content
  		t.integer :rating
  		t.references :product

  		t.timestamp
  	end
  end
end
