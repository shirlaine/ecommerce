class TransactionsController < ApplicationController

  before_action :authenticate_user!
  # before_action :check_cart!

  def new
    if current_user && session_cart
      session_cart.each { |id| current_user.cart_items.create(user_id: current_user, line_id: id) }

      gon.client_token = generate_client_token
    end
  end

  def create
    @result = Braintree::Transaction.sale(
      amount: current_user.cart_total_price,
      payment_method_nonce: params[:payment_method_nonce]
    )
    if @result.success?
      UserMailer.purchase_successful(current_user).deliver_now
      # current_user.purchase_cart_products!
      redirect_to order_path(current_user), notice: 'Congratulations! Your transaction was successfully completed!'
    else
      flash[:alert] = 'Something went wrong while processing your transaction. Please try again!'
      gon.client_token = generate_client_token
      render :new
    end
  end

  private

  def generate_client_token
    Braintree::ClientToken.generate
  end

  # def check_cart!
  #   if current_user.get_cart_products.blank?
  #     flash[:alert] = 'Please add some items to your cart before checking out!'
  #     redirect_to root_path
  #   end
  # end

end
