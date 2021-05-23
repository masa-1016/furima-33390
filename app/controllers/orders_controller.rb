class OrdersController < ApplicationController

  include ActiveModel::Model
  #attr_accessor :hoge,:fuga...

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def save
    # 各テーブルにデータを保存する処理を書く
  end

  private

  def order_params
    params.require(:order).permit(:price)
  end

end

