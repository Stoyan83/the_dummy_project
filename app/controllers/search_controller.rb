class SearchController < ApplicationController
  def index
    @query = Page.ransack(params[:q])
    @pages = @query.result(distinct: true)
  end
end
