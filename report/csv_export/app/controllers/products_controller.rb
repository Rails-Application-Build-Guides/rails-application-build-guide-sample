class ProductsController < ApplicationController
  before_action :set_products, only: [:search, :export_csv]

  def index
    @q = Product.search
  end

  def search
  end

  def export_csv
    send_data @products.to_csv, filename: "#{Time.current.strftime('%Y%m%d')}.csv"
  end

  private

  def search_params
    search_conditions = %i(
      code_cont name_cont name_kana_cont availability_true
      price_gteq price_lteq purchase_cost_gteq purchase_cost_lteq
    )
    params.require(:q).permit(search_conditions)
  end

  def set_products
    @q = Product.search(search_params)
    @products = @q
      .result
      .order(availability: :desc, code: :asc)
      .decorate
  end
end
