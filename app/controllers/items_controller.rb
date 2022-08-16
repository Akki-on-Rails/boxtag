class ItemsController < ApplicationController
  before_action :set_box, only: [:new, :create, :show]

  def index
    @items = Item.where(params[:box_id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[item_params])
    @item.box = Item.find(params[:box_id])
    if @item.save
      redirect_to item_path(@item)
    else
      redirect_to box_path(@box)
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  def set_box
    @box = Box.find(params[:box_id])
  end
end
