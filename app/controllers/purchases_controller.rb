class PurchasesController < ApplicationController

  def new
    @purchase = Purchase.new
  end

  def show
    @purchase = Purchase.find(params[:id])
    @total = 0
  end

  def create
    @purchase = Purchase.new(purchase_params)

    respond_to do |format|
      if @purchase.save

        # # Don't know if this code works yet:
        # # Decreases product stock by x (for each product, find..., decrease...)
        # # unless @product.stock < 1
        # #   @product.stock -= 1
        # # end

        # # Sets order status to paid
        # current_order.status = "Paid"

        # # Empties cart
        # session[:order_id] = nil

        format.html do
          redirect_to purchase_path(@purchase.id), notice: 'Thank you for your order!' 
        end

      else
        format.html { render action: 'new' }
      end
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:email, :address, :name, :cc_number, :cvv, :zipcode, :expiration_month, :expiration_year, :order_id)
  end
end