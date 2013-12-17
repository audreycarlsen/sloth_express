class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
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
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:email, :address, :name, :cc_number, :cc_expiration, :cvv, :zipcode )
  end
end
