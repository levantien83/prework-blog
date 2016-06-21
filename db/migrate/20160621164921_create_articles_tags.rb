class CreateArticlesTags < ActiveRecord::Migration
  def change
    create_table :articles_tags, :id => false do |t|
      t.references :article, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
