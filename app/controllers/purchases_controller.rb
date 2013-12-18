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
    # @product = Product.find(params[:product_id])
    @order_item = OrderItem.find_by(product_id: @product.id, order_id: session[:order_id])

    if @purchase.save
      @product.stock -= @order_item.quantity

      current_order.status = "Paid"
      # Empties cart
      session[:order_id] = nil

      redirect_to purchase_path(@purchase.id), notice: 'Thank you for your order!'
    else
      redirect_to purchase_path(@purchase.id), notice: 'Your order was not completed. Please try again!'
  end

  private
  def purchase_params
    params.require(:purchase).permit(:email, :address, :name, :cc_number, :cvv, :zipcode, :expiration_month, :expiration_year, :order_id)
  end
end