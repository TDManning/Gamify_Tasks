class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :points, default: 0
      t.references :theme, foreign_key: { to_table: :themes, on_delete: :nullify }
      t.integer :avatar_id, null: true

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    add_foreign_key :users, :rewards, column: :avatar_id
  end
end
