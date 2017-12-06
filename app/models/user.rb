class User < ApplicationRecord
  has_secure_password

  has_many :UserArticles, dependent: :destroy
  has_many :Articles, :through => :UserArticles

end
