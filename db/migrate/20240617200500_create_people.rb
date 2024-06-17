class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :age
      t.string :address

      t.timestamps
    end
  end
end
