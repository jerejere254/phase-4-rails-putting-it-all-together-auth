class CreateTourists < ActiveRecord::Migration[6.1]
  def change
    create_table :tourists do |t|
      t.string :username
      t.string :user_type
      t.integer :phone
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end
