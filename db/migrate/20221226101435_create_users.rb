class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login_id
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :login_id, unique: true
  end
end
