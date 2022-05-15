class ApplicationController < ActionController::Base
  before_action :actions_with_current_user, :set_query

  def actions_with_current_user
    if current_user
      @email = current_user.email
    end
  end

  def set_query
    @q = params[:q]
    @query = Product.ransack(@q)
  end
end
