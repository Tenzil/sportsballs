class CreateBlorghArticles < ActiveRecord::Migration
  def change
    create_table :blorgh_articles do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
