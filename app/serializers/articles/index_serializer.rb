class Articles::IndexSerializer < ActiveModel::Serializer
  include ActionView::Helpers::TextHelper

  attributes :id, :title, :body

  def body
    truncate(object.body, length: 75)
  end

end