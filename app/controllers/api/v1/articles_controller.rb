class Api::V1::ArticlesController < ApplicationController

  def show
    article = Article.find(params[:id])
    render json: { entries: article }
  end

end