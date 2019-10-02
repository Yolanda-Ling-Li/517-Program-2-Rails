class CreateHoldRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :hold_requests do |t|
      t.references :library
      t.references :student
      t.references :book
      t.timestamps
    end
  end
end
