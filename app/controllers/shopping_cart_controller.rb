class ShoppingCartController < ApplicationController
  before_action :load_cart_products, only: [:index]
  before_action :authenticate_user!, only: [:place_order]

  def index
  end

  def place_order
    flash[:notice] = "Покупка прошла успешно"
    session[:cart_product_ids] = []
    redirect_back(fallback_location: root_path)
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart_product_ids] << id unless session[:cart_product_ids].include?(id)
    redirect_to product_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart_product_ids].delete(id)
    redirect_to product_path
  end

  def load_cart_products
    @cart_products = Product.find(session[:cart_product_ids])
  end
end
