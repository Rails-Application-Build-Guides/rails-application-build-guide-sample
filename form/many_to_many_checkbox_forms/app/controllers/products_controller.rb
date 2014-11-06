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
    @product = Form::Product.new
  end

  def edit
    @product = Form::Product.find(params[:id])
  end

  def create
    @product = Form::Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "商品 #{@product.name} を登録しました。"
    else
      render :new
    end
  end

  def update
    @product = Form::Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to products_path, notice: "商品 #{@product.name} を更新しました。"
    else
      render :edit
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

  def product_params
    params
      .require(:form_product)
      .reverse_merge(category_ids: [])
      .permit(Form::Product::REGISTRABLE_ATTRIBUTES + Form::Product::REGISTRABLE_RELATIONS)
  end
end
