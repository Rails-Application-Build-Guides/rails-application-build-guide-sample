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
  end

  def new
    @form = Form::ProductCollection.new
  end

  def create
    @form = Form::ProductCollection.new(product_collection_params)
    if @form.save
      redirect_to :products, notice: "#{@form.target_products.size}件の商品を登録しました。"
    else
      render :new
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

  def product_collection_params
    params
      .require(:form_product_collection)
      .permit(products_attributes: Form::Product::REGISTRABLE_ATTRIBUTES)
  end
end
