class AddColumnsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :subtitle, :string
    add_column :books, :publisher, :string
    add_column :books, :publishedDate, :string
    add_column :books, :industryIdentifiers, :string
    add_column :books, :pageCount, :integer
    add_column :books, :imageLinks, :string
    add_column :books, :previewLink, :string
  end
end
