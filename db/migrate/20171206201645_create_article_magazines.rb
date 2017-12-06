class CreateArticleMagazines < ActiveRecord::Migration[5.1]
  def change
    create_table :article_magazines do |t|
      t.references :article, index: true, foreign_key: true
      t.references :magazine, index: true, foreign_key: true

      t.timestamps
    end
  end
end
