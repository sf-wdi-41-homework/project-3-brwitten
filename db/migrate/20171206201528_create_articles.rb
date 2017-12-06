class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :url
      t.string :title
      t.string :author
      t.string :published
      t.string :text

      t.timestamps
    end
  end
end
