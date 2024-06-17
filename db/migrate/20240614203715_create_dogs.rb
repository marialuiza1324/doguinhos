class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.string :color
      t.belongs_to :person, foreign_key: true, null: false

      t.timestamps
    end
  end
end
