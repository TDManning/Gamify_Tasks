class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.integer :points_awarded, default: 0
      t.boolean :completed, default: false
      t.datetime :completed_at
      t.datetime :due_date
      t.string :priority, default: 'low' # 'low', 'medium', 'high'
      t.string :category
      t.boolean :recurring, default: false
      t.string :recurrence_frequency
      t.text :notes
      t.string :attachment_url
      t.string :status, default: 'pending' # 'pending', 'in progress', 'completed'

      t.timestamps
    end
  end
end
