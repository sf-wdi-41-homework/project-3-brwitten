class AddMagazineReferenceToArticleMagazine < ActiveRecord::Migration[5.1]
  def change
      add_reference :article_magazines, :magazine, foreign_key: true
  end
end
