class CreateJournals < ActiveRecord::Migration[6.0]
  def change
    create_table :journals do |t|
      t.string :title
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key :journals, :users, column: :author_id
  end
end
