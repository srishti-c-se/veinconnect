# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Cleaning database...'
Facility.destroy_all

puts '🌱 Seeding hospitals and clinics in Mauritius...'

facilities = [
  { name: "Victoria Hospital", address: "Quatre Bornes, Mauritius", Phone_number:"4253031", facility_type: "Hospital" },
  { name: "Jeevanjee Hospital", address: "Port Louis, Mauritius",phone_number:"2031002", facility_type: "Hospital" },
  { name: "Wellkin Hospital", address: "Moka, Mauritius",Phone_number:"6051000" facility_type: "Hospital" },
  { name: "MedPoint Clinic", address: "Grand Baie, Mauritius",Phone_number:"426 7777" facility_type: "Clinic" },
  { name: "C-Care Darné", address: "Georges Guibert Street Floréal, Mauritius”, phone_number: "6012300", facility_type: "Clinic" },
  { name: "C-Care Moka", address: "Royal Road, Moka, Mauritius",Phone_number:"6051000" facility_type: "Clinic" },
  { name: "C-Care Tamarin", address: "District One Royal Road, La Mivoie, Tamarin, Black River, Mauritius",Phone_number:"4601900" facility_type: “Clinic” },
  { name: "Clinique du Nord", address: "Grand Baie, Mauritius",phone_number:"2472532" facility_type: "Clinic" },
  { name: "Victoria Clinic", address: "Quatre Bornes, Mauritius",phone_number:"4020800"  facility_type: "Clinic" },
  { name: "Jeetoo Hospital", address: "Port Louis, Mauritius",phone_number:"2031001" facility_type: "Hospital" },
  { name: "Sun Medical Clinic", address: "Curepipe, Mauritius",phone_number:"6061300" facility_type: "Clinic" },
  { name: "Artemis Curepipe Hospital", address: "Curepipe, Mauritius",phone_number:"6515050" facility_type: "Clinic"},
  {name: "c-care Grand Baie" , address: "Chemin Vinght Pied Mauritius",phone_number:"6012500" facility_type: "clinic"},
  {name: "Premium Care Clinic", address:"Beaux-Songes Link Road, Vacoas-Phoenix",phone_number:"4908128" facility_type:"clinic"},
  {name: "Nirvaran Clinic", address:"Quatre Bornes",phone_number:"5506 3945" facility_type:"clinic"},
  {name: "Clinique Ferrière de Bon Secours", address: "curepipe, Mauritius",phone_number:"676 3332" facility_type:"clinic"},
  {name:"Jawaharlal Nehru Hospital", address:"Rose Belle, Mauritius",phone_number:"6037000" facility_type: "Hospital"},
  {name:"RightNow Medical Hub" , address:"Curepipe, Mauritius",phone_number:"5479 4843" facility_type: "Clinic"},
  {name:"City Clinic" , address: "Sir Edgar Laurent St, Port Louis" ,phone_number:"2061600" facility_type: "clinic"},
  {name:"Medic World", address: " MU, 5 Av. Des Capucines, Quatre Bornes 71705" ,phone_number:"2061600" facility_type: "clinic"},
  {name:"Clinique Muller (Ex-Lorette)", "Address: MGMJ+736, Higginson Street, Curepipe",phone_number:"6702911" Facility_type:"clinic"},
  {name:"Clinique Bon Pasteur", "Rue Thomy MU, G. Pitot St, Beau Bassin-Rose Hill 71362",phone_number:"4019500" Facility_type:"clinic"},
  {name:"Clinique du Nord", "Clinique du Nord",phone_number:"2472532" Facility_type:"clinic"},
  {name:"Phoenix Community Health Centre", Address:"PG74+9JX, Edgar Quirin Avenue, Vacoas-Phoenix",phone_number:"6964287" Facility_type: "Clinic"},
  {name:"Rose Hill Area Health Centre", Address:"QF4H+H79, B 1, Beau Bassin-Rose Hill",phone_number:"4541937" Facility_type: "clinic"},
  {name:"Medical Surgical Centre Ltd", Address:"Rue Goerge Gilbert,Floreal Georges Guibert St, Curepipe 74111" ,phone_number:"6012300" Facility_type:"clinic"},
  {name:"Forest-Side Community Health Center", Address:"Curepipe" ,phone_number:"6742647" Facility_type "clinic"},
  {name:"Holyrood Community Centre", Address:"MFPG+CWM, Reservoir Rd, Vacoas-Phoenix",phone_number:"6317601" Facility_type:"clinic"},
]

facilities.each do |facility|
  Facility.create!(facility)
end

puts '✅ Done seeding hospitals and clinics!'
