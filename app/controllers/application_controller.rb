class ApplicationController < ActionController::Base
  before_action :actions_with_current_user
  before_action :initialize_session
  before_action :set_cart_count
  add_flash_types :error

  def actions_with_current_user
    if current_user
      @email = current_user.email
    end
  end

  private

  def initialize_session
    session[:cart_product_ids] ||= []
  end

  def set_cart_count
    @cart_count = Product.find(session[:cart_product_ids]).count
  end
end
