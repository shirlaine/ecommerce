class PagesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @products = Product.all
  end

  def benefits
  end
end
