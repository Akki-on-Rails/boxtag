class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @collections = Collection.joins(user_collections: :user)
  end

  def search
    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])
    # else
      # render :new
    end
  end
end
