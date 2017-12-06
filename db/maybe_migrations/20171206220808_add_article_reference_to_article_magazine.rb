class AddArticleReferenceToArticleMagazine < ActiveRecord::Migration[5.1]
  def change
    add_reference :article_magazines, :article, foreign_key: true
  end
end
