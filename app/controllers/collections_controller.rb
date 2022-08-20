class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :destroy]

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.save
    if @collection.save
      UserCollection.create(user: current_user, collection: @collection)
      redirect_to collection_path(@collection)
    else
      render :new
    end
  end

  def index
    @user = current_user
    @collections = Collection.joins(user_collections: :user)
  end

  def show
    @user_collections = UserCollection.where(id: @collection.id)
    @users = User.joins(user_collections: :collection)
    @box = Box.new
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    @collection.update(collection_params)
    redirect_to collection_path(@collection)
  end

  def destroy
    if @collection.destroy
      redirect_to collections_path
    else
      render :index
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name, :description)
  end

end
