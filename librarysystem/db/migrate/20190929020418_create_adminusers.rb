class CreateAdminusers < ActiveRecord::Migration[6.0]
  def change
    create_table :adminusers do |t|
      t.string :email
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
