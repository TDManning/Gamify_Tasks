class CreateThemes < ActiveRecord::Migration[7.1]
  def change
    create_table :themes do |t|
      t.string :name, null: false
      t.text :description
      t.string :css_class
      t.string :image_url

      t.timestamps
    end
  end
end
