class RenameBookColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :book, :book_id
  end
end
