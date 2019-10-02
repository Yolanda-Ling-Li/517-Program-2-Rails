class CreateOweMoneys < ActiveRecord::Migration[6.0]
  def change
    create_table :owe_moneys do |t|
      t.date :borrow_date
      t.integer :overdue_fine
      t.references :library
      t.references :student
      t.references :book

      t.timestamps
    end
  end
end
