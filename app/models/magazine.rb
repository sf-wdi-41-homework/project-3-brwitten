class Magazine < ApplicationRecord

  has_many :ArticleMagazine, dependent: :destroy
  has_many :Articles, :through => :ArticleMagazine

end
