class UserCollectionController < ApplicationController
  def new
    @user_collection = UserCollection.new
  end

  def create
    @user_collection = UserCollection.new(user_collection_params)
    @collection = UserCollection.find(params[:collection_id])
    @user_collection.collection = @collection
    @user_collection.kind = "collaborator"
    @user_collection.save
    redirect_to collection_path(@collection)
  end

  def user_collection_params
    params.require(:user_collection).permit(:user_id, :collection_id)
  end
end
