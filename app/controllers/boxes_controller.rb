class BoxesController < ApplicationController
  def new
    @box = Box.new
  end

  def create
    @box = Box.new(params[box_params])
    @box.user = current_user
    @box.collection = Box.find(params[:collection_id])
    if @box.save
      redirect_to booking_path(@box)
    else
      redirect_to collection_path(@collection)
    end
  end

  private

  def box_params
    params.require(:box).permit(:name, :description)
  end
end
