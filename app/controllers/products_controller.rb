class ProductsController < ApplicationController
  include ActiveRecord::Sanitization::ClassMethods

  def index
    @products =
      Product.order(
        sanitize_sql_for_order(
          "#{params[:sort_field]} #{params[:sort_direction]}"
        )
      )

    @sort_direction =
      if params[:sort_direction] == "desc" then "asc" else "desc" end
  end
end
