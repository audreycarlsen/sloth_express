class OrdersController < ApplicationController

  def show
  end

  # def index
  # end

  def edit
  end

  def create
   
  
  end

  def update
  end


  private

  def set_order
    @order = Order.find(params[:id])
  end 

  def order_params
    params.require(:order).permit(:status, :user_id, :products => {})
  end


end
