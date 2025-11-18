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
  { name: "Victoria", address: "Quatre Bornes, Mauritius", phone_number: "4253031", facility_type: "Hospital" },
  { name: "Jeevanjee Hospital", address: "Port Louis, Mauritius", phone_number: "2031002", facility_type: "Hospital" },
  { name: "Wellkin Hospital", address: "Moka, Mauritius", phone_number: "6051000", facility_type: "Hospital" },
  { name: "MedPoint Clinic", address: "Grand Baie, Mauritius", phone_number: "4267777", facility_type: "Clinic" },
  { name: "C-Care Darné", address: "Floréal, Mauritius", phone_number: "6012300", facility_type:"Clinic" },
  { name: "C-Care Moka", address: "Royal Road, Moka, Mauritius", phone_number: "6051000", facility_type: "Clinic" },
  { name: "C-Care Tamarin", address: "Tamarin, Mauritius", phone_number: "4601900", facility_type: "Clinic" },
  { name: "Clinique du Nord", address: "Grand Baie, Mauritius", phone_number: "2472532", facility_type: "Clinic" },
  { name: "Victoria Clinic", address: "Quatre Bornes, Mauritius", phone_number: "4020800", facility_type: "Clinic" },
  { name: "Jeetoo Hospital", address: "Port Louis, Mauritius", phone_number: "2031001", facility_type: "Hospital" },
  { name: "Sun Medical Clinic", address: "Curepipe, Mauritius", phone_number: "6061300", facility_type: "Clinic" },
  { name: "Artemis Curepipe Hospital", address: "Curepipe,", phone_number: "6515050", facility_type: "Clinic" },
  { name: "C-Care Grand Baie", address: "Grand Baie, Mauritius", phone_number: "6012500", facility_type: "Clinic" },
  { name: "Premium Care Clinic", address: "Vacoas, Mauritius", phone_number: "4908128", facility_type: "Clinic" },
  { name: "Nirvaran Clinic", address: "Quatre Bornes, Mauritius", phone_number: "55063945", facility_type: "Clinic" },
  { name: "Clinique Ferrière", address: "Curepipe, Mauritius", phone_number: "6763332", facility_type: "Clinic" },
  { name: "Jawaharlal Nehru", address: "Rose Belle, Mauritius", phone_number: "6037000", facility_type: "Hospital" },
  { name: "RightNow Medical Hub", address: "Curepipe, Mauritius", phone_number: "54794843", facility_type: "Clinic" },
  { name: "City Clinic", address: "Port Louis, Mauritius", phone_number: "2011600", facility_type: "Clinic" },
  { name: "Medic World", address: "Quatre Bornes, Mauritius", phone_number: "4073000", facility_type: "Clinic" },
  { name: "Clinique Muller", address: "Curepipe, Mauritius", phone_number: "6702911", facility_type: "Clinic" },
  { name: "Phoenix Health Centre", address: "Vacoas, Mauritius", phone_number: "6964286", facility_type: "Clinic" },
  { name: "Rose Hill Centre", address: "Rose Hill, Mauritius", phone_number: "4541937", facility_type: "Clinic" },
  { name: "Medical Surgical Centre", address: "Floreal, Mauritius", phone_number: "6012300", facility_type: "Clinic" },
  { name: "Forest-Side Health Center", address: "Mauritius", phone_number: "6742647", facility_type: "Clinic" },
  { name: "Holyrood Community Centre", address: "Vacoas, Mauritius", phone_number: "6973073", facility_type: "Clinic" },
  { name: "Mahebourg Hospital", address: "Mahebourg, Mauritius", phone_number: "6042000", facility_type: "Hospital" },
  { name: "Eagle Clinic", address: "Central Flacq, Mauritius", phone_number: "4605500", facility_type: "Clinic" },
  { name: "Lady Sushil Ramgoolam", address: "Belveder, Mauritius", phone_number: "4181364", facility_type: "Clinic" }
]

facilities.each do |facility|
  Facility.create!(facility)
end

puts "✅ Done seeding!"
puts "🧹 Cleaning users..."
User.destroy_all

puts "🌱 Seeding users..."

users = [
  {
    first_name: "John",
    last_name: "Doe",
    date_of_birth: Date.new(1990, 5, 12),
    email: "john.doe@example.com",
    password: "password123",
    phone_number: "52501234",
    address: "Quatre Bornes, Mauritius"
  },
  {
    first_name: "Jane",
    last_name: "Smith",
    date_of_birth: Date.new(1985, 7, 22),
    email: "jane.smith@example.com",
    password: "password123",
    phone_number: "52505678",
    address: "Curepipe, Mauritius"
  },
  {
    first_name: "Michael",
    last_name: "Brown",
    date_of_birth: Date.new(1992, 3, 14),
    email: "michael.brown@example.com",
    password: "password123",
    phone_number: "52509876",
    address: "Vacoas, Mauritius"
  },
  {
    first_name: "Emily",
    last_name: "Johnson",
    date_of_birth: Date.new(1988, 11, 5),
    email: "emily.johnson@example.com",
    password: "password123",
    phone_number: "52503456",
    address: "Port Louis, Mauritius"
  },
  {
    first_name: "Daniel",
    last_name: "Williams",
    date_of_birth: Date.new(1995, 2, 28),
    email: "daniel.williams@example.com",
    password: "password123",
    phone_number: "52507654",
    address: "Rose Hill, Mauritius"
  },
  {
    first_name: "Olivia",
    last_name: "Jones",
    date_of_birth: Date.new(1991, 9, 18),
    email: "olivia.jones@example.com",
    password: "password123",
    phone_number: "52502345",
    address: "Beau Bassin, Mauritius"
  },
  {
    first_name: "Matthew",
    last_name: "Garcia",
    date_of_birth: Date.new(1987, 6, 30),
    email: "matthew.garcia@example.com",
    password: "password123",
    phone_number: "52506543",
    address: "Flic en Flac, Mauritius"
  },
  {
    first_name: "Sophia",
    last_name: "Martinez",
    date_of_birth: Date.new(1993, 12, 10),
    email: "sophia.martinez@example.com",
    password: "password123",
    phone_number: "52508765",
    address: "Grand Baie, Mauritius"
  },
  {
    first_name: "Christopher",
    last_name: "Davis",
    date_of_birth: Date.new(1990, 4, 8),
    email: "christopher.davis@example.com",
    password: "password123",
    phone_number: "52504321",
    address: "Quatre Bornes, Mauritius"
  },
  {
    first_name: "Isabella",
    last_name: "Rodriguez",
    date_of_birth: Date.new(1989, 8, 25),
    email: "isabella.rodriguez@example.com",
    password: "password123",
    phone_number: "52501235",
    address: "Curepipe, Mauritius"
  },
  {
    first_name: "Joshua",
    last_name: "Wilson",
    date_of_birth: Date.new(1994, 1, 3),
    email: "joshua.wilson@example.com",
    password: "password123",
    phone_number: "52509877",
    address: "Vacoas, Mauritius"
  },
  {
    first_name: "Mia",
    last_name: "Anderson",
    date_of_birth: Date.new(1996, 5, 16),
    email: "mia.anderson@example.com",
    password: "password123",
    phone_number: "52503457",
    address: "Port Louis, Mauritius"
  },
  {
    first_name: "Andrew",
    last_name: "Thomas",
    date_of_birth: Date.new(1984, 11, 12),
    email: "andrew.thomas@example.com",
    password: "password123",
    phone_number: "52507655",
    address: "Rose Hill, Mauritius"
  },
  {
    first_name: "Charlotte",
    last_name: "Taylor",
    date_of_birth: Date.new(1991, 7, 20),
    email: "charlotte.taylor@example.com",
    password: "password123",
    phone_number: "52502346",
    address: "Beau Bassin, Mauritius"
  },
  {
    first_name: "David",
    last_name: "Moore",
    date_of_birth: Date.new(1986, 3, 29),
    email: "david.moore@example.com",
    password: "password123",
    phone_number: "52506544",
    address: "Flic en Flac, Mauritius"
  },
  {
    first_name: "Amelia",
    last_name: "Jackson",
    date_of_birth: Date.new(1992, 10, 7),
    email: "amelia.jackson@example.com",
    password: "password123",
    phone_number: "52508766",
    address: "Grand Baie, Mauritius"
  },
  {
    first_name: "Ryan",
    last_name: "White",
    date_of_birth: Date.new(1989, 6, 14),
    email: "ryan.white@example.com",
    password: "password123",
    phone_number: "52504322",
    address: "Quatre Bornes, Mauritius"
  },
  {
    first_name: "Grace",
    last_name: "Harris",
    date_of_birth: Date.new(1993, 2, 21),
    email: "grace.harris@example.com",
    password: "password123",
    phone_number: "52501236",
    address: "Curepipe, Mauritius"
  },
  {
    first_name: "Ethan",
    last_name: "Martin",
    date_of_birth: Date.new(1995, 8, 3),
    email: "ethan.martin@example.com",
    password: "password123",
    phone_number: "52509878",
    address: "Vacoas, Mauritius"
  },
  {
    first_name: "Chloe",
    last_name: "Thompson",
    date_of_birth: Date.new(1990, 12, 15),
    email: "chloe.thompson@example.com",
    password: "password123",
    phone_number: "52503458",
    address: "Port Louis, Mauritius"
  },
  {
    first_name: "Benjamin",
    last_name: "Garcia",
    date_of_birth: Date.new(1987, 9, 28),
    email: "benjamin.garcia@example.com",
    password: "password123",
    phone_number: "52507656",
    address: "Rose Hill, Mauritius"
  },
  {
    first_name: "Ella",
    last_name: "Martinez",
    date_of_birth: Date.new(1991, 1, 10),
    email: "ella.martinez@example.com",
    password: "password123",
    phone_number: "52502347",
    address: "Beau Bassin, Mauritius"
  },
  {
    first_name: "Alexander",
    last_name: "Robinson",
    date_of_birth: Date.new(1988, 4, 6),
    email: "alexander.robinson@example.com",
    password: "password123",
    phone_number: "52506545",
    address: "Flic en Flac, Mauritius"
  },
  {
    first_name: "Lily",
    last_name: "Clark",
    date_of_birth: Date.new(1994, 11, 22),
    email: "lily.clark@example.com",
    password: "password123",
    phone_number: "52508767",
    address: "Grand Baie, Mauritius"
  },
  {
    first_name: "Samuel",
    last_name: "Lewis",
    date_of_birth: Date.new(1990, 5, 19),
    email: "samuel.lewis@example.com",
    password: "password123",
    phone_number: "52504323",
    address: "Quatre Bornes, Mauritius"
  },
  {
    first_name: "Hannah",
    last_name: "Walker",
    date_of_birth: Date.new(1992, 7, 27),
    email: "hannah.walker@example.com",
    password: "password123",
    phone_number: "52501237",
    address: "Curepipe, Mauritius"
  },
  {
    first_name: "Jack",
    last_name: "Hall",
    date_of_birth: Date.new(1989, 3, 9),
    email: "jack.hall@example.com",
    password: "password123",
    phone_number: "52509879",
    address: "Vacoas, Mauritius"
  }
]

users.each { |user| User.create!(user) }

puts "✅ 27 Users seeded successfully!"
