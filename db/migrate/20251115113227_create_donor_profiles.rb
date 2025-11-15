class CreateDonorProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :donor_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :blood_type
      t.string :donor_status
      t.string :eligibility_status
      t.date :last_donation_date

      t.timestamps
    end
  end
end
