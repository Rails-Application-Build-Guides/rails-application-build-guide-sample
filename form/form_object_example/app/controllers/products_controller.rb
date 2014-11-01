class ProductsController < ApplicationController
  def index
    @product = Search::Product.new
  end

  def search
    @product = Search::Product.new(search_params)
    @products = @product
      .matches
      .order(availability: :desc, code: :asc)
      .decorate
  end

  private

  def search_params
    params
      .require(:search_product)
      .permit(Search::Product::ATTRIBUTES)
  end
end
