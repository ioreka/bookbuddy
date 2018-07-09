class RemoveIndustryIdentifiersFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :industryIdentifiers
  end
end
