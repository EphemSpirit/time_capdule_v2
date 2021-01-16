class AddBodyToJournals < ActiveRecord::Migration[6.0]
  def change
    add_column :journals, :body, :text
  end
end
