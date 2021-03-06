class Api::V1::ArticlesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :article_not_found

  def index
    articles = Article.paginate(page: params[:page], per_page: 4)
    render json: articles, each_serializer: Articles::IndexSerializer, meta: meta_attributes(articles)
  end

  def show
    article = Article.find(params[:id])
    render json: article, serializer: Articles::ShowSerializer
  end

end