class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_current_user
  before_action :set_cart_user
  before_action :transfer_session_cart

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :firstname, :lastname])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :firstname, :lastname])
  end

  private

  def set_current_user
    User.current_user = current_user
  end

  def set_cart_user
    if user_signed_in?
      Cart.create!(user_id: current_user.id) if current_user.cart.blank?
    end
    @cart = current_user.cart if user_signed_in?
  end

  def transfer_session_cart
    if current_user && session['cart']
      session_cart.each { |id| current_user.cart_items.create(user_id: current_user, line_id: id) }
      session['cart'].clear
    end
  end

  def session_cart
    if session['cart'].nil?
      session['cart'] = []
    else
      session['cart']
    end
    # session['cart'] ||session_cart= []
  end

end
