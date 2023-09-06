class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :firstname
      t.text :lastname
      t.text :email
      t.text :username
      t.text :password_digest
      t.timestamps
    end
  end
end
