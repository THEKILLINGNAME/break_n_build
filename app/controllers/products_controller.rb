class ProductsController < ApplicationController
  before_action :load_cart_products, only: [:index, :show]
  before_action :set_product, only: [:show]
  before_action :set_category, :set_stats, only: [:show]

  STATS_TRANSLATION = {
    "power_type"        => "Тип питания",
    "power"             => "Потребляемая мощность",
    "capacity"          => "Емкость аккумулятора",
    "output_voltage"    => "Выходное напряжение",
    "type_of_charge"    => "Тип",
    "rounds_per_min"    => "Оборотов/мин",
    "strokes_per_min"   => "Ударов/мин",
    "catrtridge_type"   => "Патрон",
    "drilling_diameter" => "Диаметр сверления",
    "length"            => "Длина",
    "size"              => "Размер",
    "shlitz_type"       => "Тип шлица",
    "diametr"           => "Диаметр",
    "cartridge_type"    => "Тип патрона"
  }.freeze
  CATEGORIES_TRANSLATION = {
    "drills"            => "Дрели",
    "screwdrivers"      => "Шуруповёрты",
    "chargers"          => "Аккумуляторы/зарядные устр-ва",
    "perforators"       => "Перфораторы",
    "screwdriver_bits"  => "Биты",
    "perforator_bits"   => "Буры"
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

  def set_product
    @product = Product.find(params[:id])
  end

  def set_stats
    category = @product.category

    @stats =
      @product
        .send("#{category[0..-2]}_stat")
        .attributes
        .except("id", "created_at", "updated_at")
        .transform_keys do |key|
          if STATS_TRANSLATION[key].present?
            STATS_TRANSLATION[key]
          else
            key
          end
        end
  end

  def set_category
    category = @product.category

    @category =
      if CATEGORIES_TRANSLATION.keys.include? category
        CATEGORIES_TRANSLATION[category]
      else
        category
      end
  end
end
