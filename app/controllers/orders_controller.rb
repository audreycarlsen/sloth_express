class OrdersController < ApplicationController

  def show
  end

  # def index
  # end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @products = Product.all.collect { |p| [p.name, p.id]}

    params[:order][:products].each do |product_id|
      next if product_id.to_i == 0 
      @order.products << Product.find(product_id.to_i)
    end

    respond_to do |format|
      if @order.save
        format.html { redirect_to 'orders/show', notice: 'Item was added to your cart'}
      else
        format.html { render @products_path }
      end
    end
  end

  def update
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end 

  def order_params
    params.require(:order).require(:status, :user_id, :products => {})
  end


end
