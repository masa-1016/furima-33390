class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

   def show
    @item = Item.find(params[:id])
   end

   def edit
    @item = Item.find(params[:id])
   end

   def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path
    else
      @item = Item.find(params[:id])
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :postage_id, :area_id, :delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
