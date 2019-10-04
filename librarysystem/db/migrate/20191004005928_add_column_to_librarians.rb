class AddColumnToLibrarians < ActiveRecord::Migration[6.0]
  def change
    add_column :librarians, :name, :string
  end
end
