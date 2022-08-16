class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @collections = Collection.joins(user_collections: :user)
  end
end
