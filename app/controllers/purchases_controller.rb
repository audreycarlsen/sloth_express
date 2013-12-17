class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
  end

  def show
  end

  def create
    @purchase = Purchase.new(purchase_params)

    respond_to do |format|
      if @purchase.save
        format.html do
          if current_user
            redirect_to user_path(current_user.id), notice: 'Thank you for your order!' 
          else
            redirect_to root_path, notice: 'Thank you for your order!'
          end
        end

        # Don't know if this code works yet:
        # Decreases product stock by 1
        unless @product.stock < 1
          @product.stock -= 1
        end

        # Sets order status to paid
        current_order.status = "Paid"

        # Empties cart
        session[:order_id] = nil

      else
        format.html { render action: 'new' }
      end
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:email, :address, :name, :cc_number, :cvv, :zipcode, :expiration_month, :expiration_year)
  end
end