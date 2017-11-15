class TransactionsController < ApplicationController

  before_action :authenticate_user!
  before_action :check_cart!

  def new
  end

  private

  def check_cart!
    if current_user.get_cart_products.blank?
    flash[:alert] = 'Please add some items to your cart before checking out!'
    redirect_to root_path
  end

end
