class ProductsController < ApplicationController
  def index
    @products = Product.all
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

  def product_params
    params
      .require(:form_product)
      .permit(Form::Product::REGISTRABLE_ATTRIBUTES)
  end
end
