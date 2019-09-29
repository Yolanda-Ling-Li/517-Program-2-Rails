class CreateBookHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :book_histories do |t|
      t.date :borrow_date
      t.references :student
      t.references :book

      t.timestamps
    end
  end
end
