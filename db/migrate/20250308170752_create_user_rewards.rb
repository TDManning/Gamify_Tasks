class CreateUserRewards < ActiveRecord::Migration[7.1]
  def change
    create_table :user_rewards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reward, null: false, foreign_key: true
      t.boolean :purchased, default: false
      t.boolean :unlocked, default: false

      t.timestamps
    end
  end
end

