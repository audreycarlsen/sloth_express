class AddExpirationMonthAndYearToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :expiration_month, :string
    add_column :purchases, :expiration_year, :string
    remove_column :purchases, :cc_expiration
  end
end
