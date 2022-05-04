class ProductsController < ApplicationController
  SORTABLE_FIELDS = {
    "title_asc"  => "title asc" ,
    "title_desc" => "title desc",
    "brand_asc"  => "brands.name asc" ,
    "brand_desc" => "brands.name desc",
    "price_asc"  => "price asc" ,
    "price_desc" => "price desc",
    "stock_asc"  => "stock asc" ,
    "stock_desc" => "stock desc"
  }.freeze

  def index
    # @sort_by = params[:sort_by]
    # @products = Product.includes(:brand).order SORTABLE_FIELDS[@sort_by]

    @products = @query.result(distinct: true) #TODO check sanitize_sql_for_order
  end
end
