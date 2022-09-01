class ItemsController < ApplicationController
  before_action :set_item, except: [:new, :create]
  before_action :set_box, only: [:new, :create]

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

  def edit
  end

  def update
    @box = @item[:box_id]
    if @item.update(item_params)
      redirect_to box_path(@box)
    else
      render :edit
    end
  end

  def destroy
    @box = @item[:box_id]
    @item.destroy
    redirect_to box_path(@box)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_box
    @box = Box.find(params[:box_id])
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
