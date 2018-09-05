class CreateUserDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :user_details do |t|
      t.references :user, foreign_key: true
      t.string :nationality
      t.string :age
      t.string :occupation
      t.string :sizeoforg
      t.string :sex

      t.timestamps
    end
  end
end
