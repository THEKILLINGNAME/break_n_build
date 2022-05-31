class ProductsController < ApplicationController
  before_action :load_cart_products, only: [:index, :show]

  TRANSLATIONS = {
    "power_type"        => "Тип питания",
    "power"             => "Потребляемая мощность",
    "capacity"          => "Емкость аккумулятора",
    "output_voltage"    => "Выходное напряжение",
    "type_of_charge"    => "Тип",
    "rounds_per_min"    => "Оборотов в мин.",
    "strokes_per_min"   => "Ударов в мин.",
    "catrtridge_type"   => "Патрон",
    "drilling_diameter" => "Диаметр сверления",
    "length"            => "Длина",
    "size"              => "Размер",
    "shlitz_type"       => "Тип шлица",
    "diametr"           => "Диаметр",
    "cartridge_type"    => "Тип патрона"
  }.freeze

  def delete_category
    session[:category] = nil
    redirect_to products_path
  end

  def index
    if params[:category]
      session[:category] = params[:category]
    end

    @category = session[:category]
    if @category
      params[:q] ||= {}
      params[:q][:category_eq] = @category
    end

    @q = params[:q]
    @query = Product.ransack(@q)
    @products = @query.result(distinct: true)

    @show_count =
      params[:q] && params[:q][:title_or_brand_name_i_cont_any].present? ||
      params[:q] && params[:q][:price_gteq].present?
  end

  def show
    @product = Product.find(params[:id])

    @stats = get_stats(@product)
  end

  def show_add_to_cart
    id = params[:id]
    session["cart_products"][id] = { amount: 1 }

    redirect_to product_path
  end

  def show_remove_from_cart
    id = params[:id]
    session["cart_products"].delete(id)
    redirect_to product_path
  end

  private

  def load_cart_products
    @cart_products = Product.find(session["cart_products"].keys)
  end

  def get_stats(product)
    category = product.category

    product
      .send("#{category[0..-2]}_stat")
      .attributes
      .except("id", "created_at", "updated_at")
      .transform_keys do |key|
        if TRANSLATIONS[key].present?
          TRANSLATIONS[key]
        else
          key
        end
      end
  end
end
