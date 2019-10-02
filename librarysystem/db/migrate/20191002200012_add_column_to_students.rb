class AddColumnToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :name, :string
    add_column :students, :university, :string
    add_column :students, :maxborrowbooks, :integer
  end
end
