class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.datetime  :date
      t.string :content
      t.string :slug
      t.string :source, default:"VroomVroom"
      t.timestamps
    end
  end
end
