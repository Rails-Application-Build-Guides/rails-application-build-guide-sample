class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update]

  def index
    @q = Order.search
  end

  def search
    @q = Order.search(search_params)
    @orders = @q.result.preload(:corporation)
  end

  def new
    @order = Form::Order.new
  end

  def edit
    @order = Form::Order.find(params[:id])
  end

  def create
    @order = Form::Order.new(order_params)
    if @order.save
      redirect_to orders_path, notice: "受注 #{@order.name} を登録しました。"
    else
      render :new
    end
  end

  def update
    if @order.update_attributes(order_params)
      redirect_to orders_path, notice: "受注 #{@order.name} を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    Order.find(params[:id]).destroy
    redirect_to orders_url, notice: '受注を削除しました。'
  end

  private

  def set_order
    @order = Form::Order.find(params[:id])
  end

  def search_params
    search_conditions = %i(
      name_cont corporation_name_cont price_gteq price_lteq
    )
    params.require(:q).permit(search_conditions)
  end

  def order_params
    params
      .require(:form_order)
      .permit(
        Form::Order::REGISTRABLE_ATTRIBUTES +
        [order_details_attributes: Form::OrderDetail::REGISTRABLE_ATTRIBUTES]
      )
  end
end
