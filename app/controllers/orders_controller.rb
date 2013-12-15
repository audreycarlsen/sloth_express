class OrdersController < ApplicationController
  def show
  end

  def index
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
  end

  def update
  end

  private

  def order_params
    params.require(:order).require(:status, :user_id)
  end


end
