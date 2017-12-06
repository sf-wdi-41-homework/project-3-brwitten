class CreateUserArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_articles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true

      t.timestamps
    end
  end
end
