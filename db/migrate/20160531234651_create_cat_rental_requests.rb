class CreateCatRentalRequests < ActiveRecord::Migration
  def change
    create_table :cat_rental_requests do |t|
      t.integer :cat_id, null: false
      t.text :start_date, null: false
      t.text :end_date, null: false
      t.string :status, default: 'PENDING'

      t.timestamps null: false
    end

    add_index :cat_rental_requests, :cat_id
  end
end
