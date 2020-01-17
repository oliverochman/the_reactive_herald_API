class Article < ApplicationRecord
	belongs_to :journalist, class_name: 'User'
end