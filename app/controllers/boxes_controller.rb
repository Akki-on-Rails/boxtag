class BoxesController < ApplicationController
  before_action :set_box, only: [:show, :edit, :update, :destroy]

  def new
    @box = Box.new
    @collection = Collection.find(params[:collection_id])
  end

  def create
    @box = Box.new(box_params)
    @collection = Collection.find(params[:collection_id])
    @box.collection = @collection
    @box.save
    redirect_to box_path(@box)
    # else
    #   redirect_to collection_path(@collection)
    # end
  end

  def show
  end

  def edit
  end

  def update
    @box.update(box_params)
    redirect_to box_path(@box)
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
