class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :provider
      t.string :uid
      t.references :contact
      t.boolean :admin
      t.string :status
      t.timestamps
    end
    add_index :users, :email
    add_index :users, [:provider, :uid]
    add_index :users, :contact_id
    add_index :users, :status
  end
end
