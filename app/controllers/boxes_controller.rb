class BoxesController < ApplicationController
  before_action :set_box, only: [:show, :destroy]

  def new
    @box = Box.new
  end

  def create
    @box = Box.new(params[box_params])
    @box.collection = Box.find(params[:collection_id])
    if @box.save
      redirect_to box_path(@box)
    else
      redirect_to collection_path(@collection)
    end
  end

  def show
  end

  def index
    @boxes = Box.all
  end

  def destroy
    if @box.destroy
      redirect_to boxes_path
    else
      render :index
    end
  end

  private

  def set_box
    @box = Box.find(params[:id])
  end

  def box_params
    params.require(:box).permit(:name, :description)
  end
end
