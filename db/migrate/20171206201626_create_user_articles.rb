class CreateUserArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_articles do |t|

      t.timestamps
    end
  end
end
