class CreateDonations < ActiveRecord::Migration[7.1]
  def change
    create_table :donations do |t|
      t.references :donor_profile, null: false, foreign_key: true
      t.references :blood_request, null: false, foreign_key: true
      t.references :facility, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
