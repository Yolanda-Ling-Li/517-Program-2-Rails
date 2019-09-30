class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.references :student
      t.references :book
      t.timestamps
    end
  end
end
