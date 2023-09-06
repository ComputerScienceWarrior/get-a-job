class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.text :title
      t.text :caption
      t.text :project_url
      t.text :github_url
      t.text :thumbnail_url
      t.text :demo_url

      t.timestamps
    end
    add_reference :projects, :portfolio, foreign_key: true
  end
end
