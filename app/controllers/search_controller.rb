class SearchController < ApplicationController

  def search
    @users = User.search(params[:name])
    @search_params = search_search_params
  end


  private

  def search_search_params
    params.fetch(:search, {}).permit(:name)
  end

end
