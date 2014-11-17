class ProductsController < ApplicationController
  def index
    @q = Product.search
  end

  def search
    @q = Product.search(search_params)
    @products = @q
      .result
      .order(availability: :desc, code: :asc)
      .decorate
    if params[:export_csv]
      send_data @products.to_csv, filename: "#{Time.current.strftime('%Y%m%d')}.csv"
    else
      render :search
    end
  end

  private

  def search_params
    search_conditions = %i(
      code_cont name_cont name_kana_cont availability_true
      price_gteq price_lteq purchase_cost_gteq purchase_cost_lteq
    )
    params.require(:q).permit(search_conditions)
  end
end
