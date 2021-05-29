class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :move_to_index2, only: [:index, :create]

  def index
    @charge_form = ChargeForm.new
  end

  def create
    @charge_form = ChargeForm.new(charge_params)
    if @charge_form.valid?
      pay_item
      @charge_form.save
      redirect_to root_path
    else
      @charge_form = nil
      render :index
    end
  end

  private

  def charge_params
    params.require(:charge_form).permit(:postal, :area_id, :city, :address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: charge_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def move_to_index2
    if @item.history.present?
      redirect_to root_path
    end
  end

end

