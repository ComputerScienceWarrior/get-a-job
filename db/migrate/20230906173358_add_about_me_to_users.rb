class AddAboutMeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :about_me, :text, default: ''
  end
end
