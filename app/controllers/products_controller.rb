class ProductsController < ApplicationController
  def index
    @show_count =
      params[:q] && params[:q][:title_or_brand_name_i_cont_any].present? ||
      params[:q] && params[:q][:price_gteq].present?

    @products = @query.result(distinct: true)
  end
end
