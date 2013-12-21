class ManualSqlByKerriForTheLols < ActiveRecord::Migration
  def change
    # This didn't wrk and its Kerri's fault
    # if Rails.env.producton?
    #   connection.execute(%q{
    #     alter table puchases
    #     alter column order_id
    #     type integer using cast(order_id as integer)
    #   })
    # end
  end
end
