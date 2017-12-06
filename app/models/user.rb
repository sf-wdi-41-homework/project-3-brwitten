class User < ApplicationRecord
  has_secure_password

  has_many :user_articles, dependent: :destroy
  has_many :articles, :through => :user_articles

end
