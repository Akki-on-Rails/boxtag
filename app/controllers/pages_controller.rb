class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @collections = Collection.joins(user_collections: :user).to_a

  end

  def search
    if params[:query].present?
      @collection_results = PgSearch.multisearch(params[:query]).where(searchable_type: "Collection")
      @box_results = PgSearch.multisearch(params[:query]).where(searchable_type: "Box")
      @item_results = PgSearch.multisearch(params[:query]).where(searchable_type: "Item")
    # else
      # render :new
    end
  end
end
