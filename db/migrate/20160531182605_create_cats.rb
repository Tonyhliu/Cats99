class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.date :birth_date
      t.string :sex, limit: 1
      t.string :color
      t.string :description

      t.timestamps null: false
    end
  end
end
