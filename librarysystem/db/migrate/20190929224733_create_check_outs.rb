class CreateCheckOuts < ActiveRecord::Migration[6.0]
  def change
    create_table :check_outs do |t|
      t.references :library
      t.references :student
      t.references :book
      t.timestamps
    end
  end
end
