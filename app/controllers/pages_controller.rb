class PagesController < ApplicationController

  def index
    @products = Product.all
    @cart_item = CartItem.new
  end

  def benefits; end

  def sendmail
    UserMailer.purchase_successful(current_user).deliver_now
  end

end
