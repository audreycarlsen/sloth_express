class OrderSessionController < ApplicationController
  def new
  end

  def create
    # user = User.find_by(email: params[:email])
    # if user && user.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   redirect_to products_path, :notice => "Welcome, Sloth Cadet #{user.username}! Your mission, should you choose to accept it, is to find the best in sloth themed products and values!"
    # else
    #   flash.now.alert = "Invalid email or password"
    #   render "new"
    # end
  end

  def destroy
    # session[:user_id] = nil
    # redirect_to products_path, :notice => "Bye, Sloth Cadet, hope to see you soon!"
  end
end
