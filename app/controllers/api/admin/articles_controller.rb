class Api::Admin::ArticlesController < ApplicationController

  def create
    article = Article.create(article_params)
    render head: :ok
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end