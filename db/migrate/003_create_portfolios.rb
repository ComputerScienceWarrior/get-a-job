class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |t|
      t.text :title
      t.text :description
      
      t.timestamps
    end
    add_reference :portfolios, :template, foreign_key: true
  end
end
