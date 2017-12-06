class Magazine < ApplicationRecord

  has_many :article_magazines, dependent: :destroy
  has_many :articles, :through => :article_magazines

end
