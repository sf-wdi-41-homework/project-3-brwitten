class ArticleMagazine < ApplicationRecord
  belongs_to :article
  belongs_to :magazine
end
