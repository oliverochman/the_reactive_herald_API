class Api::Admin::ArticlesController < ApplicationController
  def create
    binding.pry
    article = Article.create(article_params)
    
    if article.persisted? && attach_image(article)
      render json: {
        article: article, 
        image: article.image.service_url(expires_in: 1.hour, disposition: 'inline')
      }
    else
      article.destroy
      render json: { error: article.errors.full_messages }, status: 422
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def attach_image(article)
    params_image = params['article']['image']
    if params_image && params_image.present?
      DecodeService.attach_image(params_image, article.image)
    end
  end
end