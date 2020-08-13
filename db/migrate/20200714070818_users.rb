class Users < ActiveRecord::Migration[6.0]
  def self.up
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :userName
      t.integer :mobile
      t.string :email
      t.string :bio
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
