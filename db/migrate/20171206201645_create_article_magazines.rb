class CreateArticleMagazines < ActiveRecord::Migration[5.1]
  def change
    create_table :article_magazines do |t|

      t.timestamps
    end
  end
end
