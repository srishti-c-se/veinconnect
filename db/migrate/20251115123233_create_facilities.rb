class CreateFacilities < ActiveRecord::Migration[7.1]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :phone_number
      t.string :facility_type

      t.timestamps
    end
  end
end
