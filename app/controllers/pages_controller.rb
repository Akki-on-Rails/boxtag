class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @collections = Collection.joins(user_collections: :user)
  end

  def search
    if params[:query].present?
      @collections = current_user.collections.search_name(params[:query])
      @boxes = current_user.boxes.search_name(params[:query])
      @items = current_user.items.search_name(params[:query])
    else
      @collections = Collection.none
      @boxes = Box.none
      @items = Item.none
    end
    @results_count = @collections.size + @boxes.size + @items.size
  end
end
