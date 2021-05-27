class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]

  def index
    @charge_form = ChargeForm.new
  end

  def create
    #binding.pry
    @charge_form = ChargeForm.new(charge_params)
    if @charge_form.valid?
      pay_item
      @charge_form.save
      redirect_to root_path
    else
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
      card: charege_params[:token],
      currency: 'jpy'
    )
  end

end

