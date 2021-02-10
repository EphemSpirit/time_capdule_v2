class AddForeignKeyToJournals < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :journals, :users, column: :author_id
  end
end
