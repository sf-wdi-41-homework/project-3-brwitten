class Article < ApplicationRecord
  
  has_many :UserArticles, dependent: :destroy
  has_many :Users, through: :UserArticles

end
