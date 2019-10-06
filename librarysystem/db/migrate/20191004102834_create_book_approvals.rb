class CreateBookApprovals < ActiveRecord::Migration[6.0]
  def change
    create_table :book_approvals do |t|
      t.references :library
      t.references :student
      t.references :book
      t.boolean :approval_status
      t.timestamps
    end
  end
end
