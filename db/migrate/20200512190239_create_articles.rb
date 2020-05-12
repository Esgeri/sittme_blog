class CreateArticles < ActiveRecord::Migration[5.2]
  def up
    create_table :articles do |t|
      t.string :title
      t.text :description
    end
  end

  def down
    drop_table :articles
  end
end
