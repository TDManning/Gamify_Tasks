class UpdateThemeForeignKey < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :users, :themes

    add_foreign_key :users, :themes, on_delete: :nullify
  end
end
