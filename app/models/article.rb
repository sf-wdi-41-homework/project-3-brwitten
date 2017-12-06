class Article < ApplicationRecord

  has_many :user_articles, dependent: :destroy
  has_many :users, :through => :user_articles

  has_many :article_magazines, dependent: :destroy
  has_many :magazines, :through => :article_magazines
end
