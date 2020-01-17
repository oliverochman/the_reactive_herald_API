class Api::Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  def create
    authorize(current_user)

    article = current_user.articles.create(article_params)
    binding.pry
    render head: :ok
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end