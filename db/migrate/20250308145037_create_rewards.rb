class CreateRewards < ActiveRecord::Migration[7.1]
  def change
    create_table :rewards do |t|
      t.string :name
      t.text :description
      t.integer :points_required, null: false
      t.string :image_url
      t.string :reward_type
      t.boolean :active, default: false

      t.timestamps
    end
  end
end

