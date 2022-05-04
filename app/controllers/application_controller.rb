class ApplicationController < ActionController::Base
  before_action :set_query

  def set_query
    @q = params[:q]
    @query = Product.ransack(@q) #TODO check sanitize_sql_for_order
  end
end
