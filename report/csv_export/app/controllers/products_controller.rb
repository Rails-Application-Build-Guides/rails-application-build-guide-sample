class ProductsController < ApplicationController
  def index
  end

  def export_csv
    @products = Product.all
    send_data @products.to_csv, filename: "#{Time.current.strftime('%Y%m%d')}.csv"
  end
end
