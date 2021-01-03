class RemoveAuthorsForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :journals, :authors
  end
end
