class CreateTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :templates do |t|
      t.integer :template_number
      t.text :type #beginner, intermediate, advanced (this refers to the number of project they have and will update automatically based on number of projects)
      t.text :theme # this is the theme name: ('Orange Crush', 'A Sorbet of Colors', 'Rosey Woods', etc.)
      t.boolean :dark_theme, default: false

      t.timestamps
    end
  end
end
