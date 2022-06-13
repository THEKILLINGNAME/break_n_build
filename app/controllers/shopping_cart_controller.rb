class ShoppingCartController < ApplicationController
  before_action :load_cart_products, only: [:index]
  before_action :authenticate_user!, only: [:place_order]

  def index
  end

  def add_to_cart
    id = params[:id]
    amount = session["cart_products"][id]["amount"]

    session["cart_products"][id] = { amount: amount + 1 }

    redirect_to shopping_cart_index_path
  end

  def remove_from_cart
    id = params[:id]
    amount = session["cart_products"][id]["amount"]
    price = Product.find(id).price

    subtracted_amount = amount - 1
    if subtracted_amount <= 0
      session["cart_products"].delete(id)
    else
      session["cart_products"][id] = { amount: subtracted_amount }
    end

    redirect_to shopping_cart_index_path
  end

  def delete_from_cart
    id = params[:id]
    session["cart_products"].delete(id)
    redirect_to shopping_cart_index_path
  end

  def place_order
    order_products = session["cart_products"].map do |id, options|
      OrderProduct.new(
        product_id: id.to_i,
        amount: options["amount"]
      )
    end
    order = Order.new(
      user: current_user,
      order_products: order_products,
    )

    ActiveRecord::Base.transaction do
      order_products.each do |order_product|
        order_product.save!
      end
      order.save!
    end

    flash[:notice] = "Покупка прошла успешно"
    session["cart_products"] = {}
    redirect_to products_path
  end

  private

  def load_cart_products
    @cart_products = Product.find(session["cart_products"].keys)
  end
end
