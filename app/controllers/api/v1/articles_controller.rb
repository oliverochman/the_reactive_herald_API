class Api::V1::ArticlesController < ApplicationController

  def show
    article = Article.all
    render json: { entries: article }
  end

end