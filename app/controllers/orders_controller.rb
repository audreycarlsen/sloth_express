class OrdersController < ApplicationController

  before_action :set_order, only:[:edit, :show, :update, :destroy]

  def new
    @order = Order.new
  end
  
  def show
    
    if current_order.products.count == 0
      redirect_to "/home/empty"
    end
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
