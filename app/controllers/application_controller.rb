class ApplicationController < ActionController::Base
  before_action :actions_with_current_user, :initialize_session, :set_cart_count
  # before_action :initialize_session
  # before_action :set_cart_count
  before_action :clear_category
  add_flash_types :error

  def actions_with_current_user
    if current_user
      @email = current_user.email
    end
  end

  private

  def initialize_session
    session["cart_products"] ||= {}
  end

  def set_cart_count
    @cart_count =
      session["cart_products"]
        .values
        .reduce(0) { |sum, n| sum + n["amount"] }
  end

  def clear_category
    if helpers.controller.controller_name != "products"
      session[:category] = nil
    end
  end
end
