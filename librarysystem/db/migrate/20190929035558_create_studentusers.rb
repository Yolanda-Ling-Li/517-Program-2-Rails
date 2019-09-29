class CreateStudentusers < ActiveRecord::Migration[6.0]
  def change
    create_table :studentusers do |t|
      t.string :name
      t.string :email
      t.string :university
      t.integer :maxborrowdays

      t.timestamps
    end
  end
end
