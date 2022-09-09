class UserCollectionsController < ApplicationController
  def new
    @user_collection = UserCollection.new
    @collection = Collection.find(params[:collection_id])
    @user = UserCollection.joins(:user).find_by( user: {email: @email})
  end

  def create
    user = User.find_by(email: params.dig(:user_collection, :email))
    if user.nil?
      @error = "User not found"
      @user_collection = UserCollection.new
      @collection = Collection.find(params[:collection_id])
      render :new
      # handle non existing user (send email invite)
    else
      @collection = Collection.find(params[:collection_id])
      @user_collection = UserCollection.new(user: user, collection: @collection, kind: :collaborator)
      if @user_collection.save
        redirect_to collection_path(@collection)
      else
        render :new
      end
    end
  end

  def edit
  end

  def destroy
    @user_collection = UserCollection.find(params[:id])
    if @user_collection.destroy
      redirect_to collection_path(@user_collection.collection)
    else
      render :new
    end
  end

  def user_collection_params
    params.require(:user_collection).permit(:email, :collection_id)
  end
end
