class CreateBloodRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :blood_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :facility, null: false, foreign_key: true
      t.string :blood_type
      t.string :status
      t.string :patient_name
      t.integer :patient_phone_number
      t.date :needed_by
      t.string :message
      t.string :quantity
      t.datetime :completed_at

      t.timestamps
    end
  end
end
