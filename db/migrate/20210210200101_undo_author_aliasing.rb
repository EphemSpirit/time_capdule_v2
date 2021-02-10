class UndoAuthorAliasing < ActiveRecord::Migration[6.0]
  def change
    remove_index :journals, :author_id
    remove_column :journals, :author_id
    add_column :journals, :user_id, :integer
    add_index :journals, :user_id
  end
end
