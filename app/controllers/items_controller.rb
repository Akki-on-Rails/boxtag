class ItemsController < ApplicationController
  before_action :set_item, except: [:new, :create]

  def index
    @items = Item.find(params[:id])
  end

  def new
    @item = Item.new  # (params[item_params])
    @box = Box.find(params[:box_id])
  end

  def create
    @item = Item.new(item_params) # (params[item_params])
    @box = Box.find(params[:box_id])
    @item.box = @box
    @item.save
    redirect_to box_path(@box)
  end

  def show
  end

  def destroy
    # raise
    # @box = @item # @box = Box.find(params[:box_id])
    @box = @item[:box_id]
    @item.destroy
    redirect_to box_path(@box)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
