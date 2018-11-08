class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, nill: false
      t.string :email, nill: false
      t.string :password_digest, nill: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
