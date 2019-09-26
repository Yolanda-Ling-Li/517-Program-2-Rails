class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :authors
      t.string :language
      t.string :published
      t.string :edition
      t.string :front_cover
      t.string :subject
      t.text :summary
      t.string :special

      t.timestamps
    end
  end
end
