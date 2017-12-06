class Article < ApplicationRecord

  has_many :UserArticles, dependent: :destroy
  has_many :Users, :through => :UserArticles

  has_many :ArticleMagazine, dependent: :destroy
  has_many :Magazines, :through => :ArticleMagazine
end
