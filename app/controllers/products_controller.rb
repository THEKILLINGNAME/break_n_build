class ProductsController < ApplicationController
  def index
    @q = params[:q]
    @query = Product.ransack(@q)

    @show_count =
      params[:q] && params[:q][:title_or_brand_name_i_cont_any].present? ||
      params[:q] && params[:q][:price_gteq].present?

    @products = @query.result(distinct: true)
  end

  def show
    @product = Product.find(params[:id])
  end
end
