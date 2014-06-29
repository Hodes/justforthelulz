class SorceryCore < ActiveRecord::Migration
  def change
    change_table :authors do |t|
      t.string :crypted_password
      t.string :salt
    end

    add_index :authors, :email, unique: true
  end
end
