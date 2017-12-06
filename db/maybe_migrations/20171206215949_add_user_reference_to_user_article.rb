class AddUserReferenceToUserArticle < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_articles, :user, foreign_key: true
  end
end
