class Api::V1::ArticlesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def show
    article = Article.find(params[:id])
    render json: article 
  end

  private
  
  def not_found
    render json: { error: "ID does not exist"}
  end

end