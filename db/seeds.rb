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

puts '🌱 Seeding Users...'
user1 = User.create!(first_name: "John", last_name: "Doe", date_of_birth: "1985-03-15",
  email: "john.doe@example.com",password: "password123",phone_number: "52512345",address: "Quatre Bornes, Mauritius",is_donor: false)
user2 = User.create!(first_name: "Sarah",last_name: "Ramsamy", date_of_birth: "1990-07-22",
  email: "sarah.ramsamy@example.com",password: "password123",phone_number: "58023456", address: "Port Louis, Mauritius",is_donor:false,)
user3 = User.create!(first_name: "Kevin",last_name: "Pillay",date_of_birth: "1995-01-10",
  email: "kevin.pillay@example.com",password: "password123",phone_number: "59098765",address: "Curepipe, Mauritius", is_donor:false,)
user4 = User.create!(first_name: "Anjali",last_name: "Kumar",date_of_birth: "1988-04-05",
  email: "anjali.kumar@example.com",password: "password123",phone_number: "59876543",address: "Rose Hill, Mauritius",  is_donor:false,)
user4 = User.create!(first_name: "Rakesh",last_name: "Singh",date_of_birth: "1979-12-19",
  email: "rakesh.singh@example.com",password: "password123",phone_number: "52654321",address: "Vacoas, Mauritius",is_donor:false,)
user5 = User.create!(first_name: "Priya",last_name: "Nath",date_of_birth: "1992-11-11",
  email: "priya.nath@example.com", password: "password123", phone_number: "53456789",address: "Grand Baie, Mauritius",is_donor:false)
user6 = User.create!(first_name: "Priya", last_name: "Nath", date_of_birth: "1992-11-11",
  email: "priya.nath@example.com", password: "password123", phone_number: "53456789", address: "Grand Baie, Mauritius", is_donor: false)
user7 = User.create!(first_name: "Arjun", last_name: "Patel", date_of_birth: "1983-06-25",
  email: "arjun.patel@example.com", password: "password123", phone_number: "54781234", address: "Flic en Flac, Mauritius", is_donor: false)
user8 = User.create!(first_name: "Leela", last_name: "Reddy", date_of_birth: "1996-09-17",
  email: "leela.reddy@example.com", password: "password123", phone_number: "55098765", address: "Mahebourg, Mauritius", is_donor: false)
user9 = User.create!(first_name: "Vikram", last_name: "Shah", date_of_birth: "1987-05-30",
  email: "vikram.shah@example.com", password: "password123", phone_number: "56012345", address: "Curepipe, Mauritius", is_donor: false)
user10 = User.create!(first_name: "Anita", last_name: "Chowdhury", date_of_birth: "1991-03-08",
  email: "anita.chowdhury@example.com", password: "password123", phone_number: "57890123", address: "Port Louis, Mauritius", is_donor: false)
user11 = User.create!(first_name: "Rohan", last_name: "Maharaj", date_of_birth: "1989-08-21",
  email: "rohan.maharaj@example.com", password: "password123", phone_number: "58765432", address: "Quatre Bornes, Mauritius", is_donor: false)
user12 = User.create!(first_name: "Nisha", last_name: "Dewan", date_of_birth: "1993-12-14",
  email: "nisha.dewan@example.com", password: "password123", phone_number: "59987654", address: "Grand Baie, Mauritius", is_donor: false)
user13 = User.create!(first_name: "Sanjay", last_name: "Bhandari", date_of_birth: "1981-02-02",
  email: "sanjay.bhandari@example.com", password: "password123", phone_number: "52345678", address: "Rose Hill, Mauritius", is_donor: false)
user14 = User.create!(first_name: "Meena", last_name: "Varma", date_of_birth: "1986-07-07",
  email: "meena.varma@example.com", password: "password123", phone_number: "53678901", address: "Vacoas, Mauritius", is_donor: false)
user15 = User.create!(first_name: "Aditya", last_name: "Singh", date_of_birth: "1994-04-28",
  email: "aditya.singh@example.com", password: "password123", phone_number: "54901234", address: "Flic en Flac, Mauritius", is_donor: true)
user16 = User.create!(first_name: "Priyanka", last_name: "Rai", date_of_birth: "1990-11-03",
  email: "priyanka.rai@example.com", password: "password123", phone_number: "55234567", address: "Curepipe, Mauritius", is_donor: true)
user17 = User.create!(first_name: "Rajesh", last_name: "Sharma", date_of_birth: "1982-06-15",
  email: "rajesh.sharma@example.com", password: "password123", phone_number: "56789012", address: "Mahebourg, Mauritius", is_donor: true)
user18 = User.create!(first_name: "Sunita", last_name: "Kapoor", date_of_birth: "1995-09-09",
  email: "sunita.kapoor@example.com", password: "password123", phone_number: "57654321", address: "Grand Baie, Mauritius", is_donor: true)
user19 = User.create!(first_name: "Manish", last_name: "Gupta", date_of_birth: "1984-12-20",
  email: "manish.gupta@example.com", password: "password123", phone_number: "58345678", address: "Port Louis, Mauritius", is_donor: true)
user20 = User.create!(first_name: "Kavita", last_name: "Chopra", date_of_birth: "1987-03-30",
  email: "kavita.chopra@example.com", password: "password123", phone_number: "59012345", address: "Quatre Bornes, Mauritius", is_donor: true)
user21 = User.create!(first_name: "Amit", last_name: "Desai", date_of_birth: "1988-08-18",
  email: "amit.desai@example.com", password: "password123", phone_number: "59876543", address: "Rose Hill, Mauritius", is_donor: true)
user22 = User.create!(first_name: "Rina", last_name: "Patel", date_of_birth: "1991-05-12",
  email: "rina.patel@example.com", password: "password123", phone_number: "50765432", address: "Vacoas, Mauritius", is_donor: true)
user23 = User.create!(first_name: "Vijay", last_name: "Nair", date_of_birth: "1983-01-25",
  email: "vijay.nair@example.com", password: "password123", phone_number: "51234567", address: "Curepipe, Mauritius", is_donor: true)
user24 = User.create!(first_name: "Nandini", last_name: "Rao", date_of_birth: "1996-10-11",
  email: "nandini.rao@example.com", password: "password123", phone_number: "51987654", address: "Flic en Flac, Mauritius", is_donor: true)
user25 = User.create!(first_name: "Harish", last_name: "Mehta", date_of_birth: "1980-07-03",
  email: "harish.mehta@example.com", password: "password123", phone_number: "52345679", address: "Grand Baie, Mauritius", is_donor: true)
user26 = User.create!(first_name: "Pooja", last_name: "Sharma", date_of_birth: "1992-02-28",
  email: "pooja.sharma@example.com", password: "password123", phone_number: "53098765", address: "Mahebourg, Mauritius", is_donor: true)
user27 = User.create!(first_name: "Raj", last_name: "Chand", date_of_birth: "1985-09-14",
  email: "raj.chand@example.com", password: "password123", phone_number: "54012345", address: "Quatre Bornes, Mauritius", is_donor: true)

puts "Seeding Facilties!!!!!!!!!"

facility1 = Facility.create!(name: "Victoria Hospital", address: "Volcy Pougnet Street, Quatre Bornes, Mauritius", phone_number: "4253031", facility_type: "hospital")
facility2 = Facility.create!(name: "Jeevanjee Hospital", address: "12-14 Joseph Riviere Street, Port Louis, Mauritius", phone_number: "2031002", facility_type: "hospital")
facility3 = Facility.create!(name: "Wellkin Hospital", address: "Royal Road, Moka, Mauritius", phone_number: "6051000", facility_type: "hospital")
facility4 = Facility.create!(name: "MedPoint Clinic", address: "Royal Road, Grand Baie, Mauritius", phone_number: "4267777", facility_type: "clinic")
facility5 = Facility.create!(name: "C-Care Darné", address: "Darné Road, Floréal, Mauritius", phone_number: "6012300", facility_type: "clinic")
facility6 = Facility.create!(name: "C-Care Moka", address: "Royal Road, Moka, Mauritius", phone_number: "6051000", facility_type: "clinic")
facility7 = Facility.create!(name: "C-Care Tamarin", address: "Royal Road, Tamarin, Mauritius", phone_number: "4601900", facility_type: "clinic")
facility8 = Facility.create!(name: "Clinique du Nord", address: "Royal Road, Grand Baie, Mauritius", phone_number: "2472532", facility_type: "clinic")
facility9 = Facility.create!(name: "Victoria Clinic", address: "St Jean Road, Quatre Bornes, Mauritius", phone_number: "4020800", facility_type: "clinic")
facility10 = Facility.create!(name: "Jeetoo Hospital", address: "Voley Pougnet Street, Port Louis, Mauritius", phone_number: "2031001", facility_type: "hospital")
facility11 = Facility.create!(name: "Sun Medical Clinic", address: "Royal Road, Curepipe, Mauritius", phone_number: "6061300", facility_type: "clinic")
facility12 = Facility.create!(name: "Artemis Curepipe Hospital", address: "Royal Road, Curepipe, Mauritius", phone_number: "6515050", facility_type: "clinic")
facility13 = Facility.create!(name: "C-Care Grand Baie", address: "Royal Road, Grand Baie, Mauritius", phone_number: "6012500", facility_type: "clinic")
facility14 = Facility.create!(name: "Premium Care Clinic", address: "St. Paul Road, Vacoas, Mauritius", phone_number: "4908128", facility_type: "clinic")
facility15 = Facility.create!(name: "Nirvaran Clinic", address: "Braham Kumari Marg, Quatre Bornes, Mauritius", phone_number: "55063945", facility_type: "clinic")
facility16 = Facility.create!(name: "Clinique Ferrière", address: "Royal Road, Curepipe, Mauritius", phone_number: "6763332", facility_type: "clinic")
facility17 = Facility.create!(name: "Jawaharlal Nehru Hospital", address: "Rose Belle, Mauritius", phone_number: "6037000", facility_type: "hospital")
facility18 = Facility.create!(name: "RightNow Medical Hub", address: "Royal Road, Curepipe, Mauritius", phone_number: "54794843", facility_type: "clinic")
facility19 = Facility.create!(name: "City Clinic", address: "Sir William Newton Street, Port Louis, Mauritius", phone_number: "2011600", facility_type: "clinic")
facility20 = Facility.create!(name: "Medic World", address: "Royal Road, Quatre Bornes, Mauritius", phone_number: "4073000", facility_type: "clinic")
facility21 = Facility.create!(name: "Clinique Muller", address: "Royal Road, Curepipe, Mauritius", phone_number: "6702911", facility_type: "clinic")
facility22 = Facility.create!(name: "Phoenix Health Centre", address: "St. Paul Road, Vacoas, Mauritius", phone_number: "6964286", facility_type: "clinic")
facility23 = Facility.create!(name: "Rose Hill Centre", address: "Royal Road, Rose Hill, Mauritius", phone_number: "4541937", facility_type: "clinic")
facility24 = Facility.create!(name: "Medical Surgical Centre", address: "Floreal, Mauritius", phone_number: "6012300", facility_type: "clinic")
facility25 = Facility.create!(name: "Forest-Side Health Center", address: "Forest-Side, Mauritius", phone_number: "6742647", facility_type: "clinic")
facility26 = Facility.create!(name: "Holyrood Community Centre", address: "Holyrood Street, Vacoas, Mauritius", phone_number: "6973073", facility_type: "clinic")
facility27 = Facility.create!(name: "Mahebourg Hospital", address: "Coastal Road, Mahebourg, Mauritius", phone_number: "6042000", facility_type: "hospital")
facility28 = Facility.create!(name: "Eagle Clinic", address: "Royal Road, Central Flacq, Mauritius", phone_number: "4605500", facility_type: "clinic")
facility29 = Facility.create!(name: "Lady Sushil Ramgoolam Clinic", address: "Royal Road, Belvedere, Mauritius", phone_number: "4181364", facility_type: "clinic")

puts "✅ Done seeding for Facility!"

blood_request1 = Blood_request.create(user_id: user1.id, facility_id: facility1.id, blood_type: "A+", needed_by: "2025-12-25", status: "pending", patient_name: user1.first_name,
                 patient_phone_number: user1.phone, message: "Urgent transfusion needed",   quantity: 2,  created_at: Time.now, completed_at: nil)

blood_request2 = Blood_request.create(user_id: user2.id, facility_id: facility2.id, blood_type: "O-", needed_by: "2025-12-28",  status: "pending",  patient_name: user2.first_name,
                 patient_phone_number: user2.phone, message: "Emergency surgery",  quantity: 1, created_at: Time.now,  completed_at: nil)

blood request3 = Blood_request.create(user_id: user3.id, facility_id: facility3.id,  blood_type: "B+", needed_by: "2025-12-30", status: "completed", patient_name: user3.first_name,
                 patient_phone_number: user3.phone, message: "Scheduled transfusion",  quantity: 3, created_at: Time.now - 2.days, completed_at: Time.now - 1.day)

blood request4 = Blood_request.create(user_id: user4.id, facility_id: facility4.id,  blood_type: "AB-",   needed_by: "2025-11-28", status: "pending",  patient_name: user4.first_name,
                 patient_phone_number: user4.phone,  message: "Post-surgery support",  quantity: 1,   created_at: Time.now, completed_at: nil)

blood request5 = Blood_request.create(user_id: user5.id, facility_id: facility5.id, blood_type: "O+", needed_by: "2025-12-01",  status: "completed",  patient_name: user5.first_name,
                 patient_phone_number: user5.phone,  message: "Routine transfusion",   quantity: 2, created_at: Time.now - 5.days, completed_at: Time.now - 3.days)

blood request6 = Blood_request.create(user_id: user6.id, facility_id: facility6.id,  blood_type: "A-", needed_by: "2025-12-05",  status: "pending",  patient_name: user6.first_name,
                 patient_phone_number: user6.phone,  message: "Urgent requirement",  quantity: 1,   created_at: Time.now,   completed_at: nil)

blood_requests7 = Blood_request.create(user_id: user7.id, facility_id: facility7.id, blood_type: "B-", needed_by: "2025-12-10",  status: "completed", patient_name: user7.first_name,
                  patient_phone_number: user7.phone, message: "Scheduled surgery", quantity: 2, created_at: Time.now - 4.days, completed_at: Time.now - 2.days)

blood_request8 = Blood_request.create(user_id: user8.id, facility_id: facility8.id,  blood_type: "AB+",  needed_by: "2025-12-12",  status: "pending",  patient_name: user8.first_name,
                 patient_phone_number: user8.phone, message: "Accident case", quantity: 1, created_at: Time.now,  completed_at: nil)

blood_request9 = Blood_request.create(user_id: user9.id, facility_id: facility9.id,  blood_type: "O-", needed_by: "2025-12-15", status: "completed", patient_name: user9.first_name,
                 patient_phone_number: user9.phone, message:"Routine transfusion", quantity: 2, created_at: Time.now - 6.days, completed_at: Time.now - 3.days)

blood_request10 = Blood_request.create(user_id: user10.id, facility_id: facility10.id, blood_type:"A+",  needed_by: "2025-12-18", status: "pending", patient_name: user10.first_name,
                  patient_phone_number: user10.phone,   message: "Emergency surgery",   quantity: 1, created_at: Time.now,   completed_at: nil )

blood_request11 = Blood_request.create(user_id: user11.id, facility_id: facility11.id,  blood_type: "B+",  needed_by: "2025-12-20",   status: "completed",  patient_name: user11.first_name,
                  patient_phone_number: user11.phone,  message: "Post-surgery",    quantity: 3,   created_at: Time.now - 7.days, completed_at: Time.now - 5.days )

blood_request12 = Blood_request.create(user_id: user12.id, facility_id: facility12.id,  blood_type: "AB-",  needed_by: "2025-12-22",  status: "pending",  patient_name: user12.first_name,
                  patient_phone_number: user12.phone,   message: "Urgent transfusion",    quantity: 1, created_at: Time.now,   completed_at: nil)

blood_request13 = Blood_request.create(user_id: user13.id, facility_id: facility13.id, blood_type: "O+", needed_by: "2025-12-24", status: "completed",  patient_name: user13.first_name,
                   patient_phone_number: user13.phone, message: "Scheduled transfusion", quantity: 2, created_at: Time.now - 3.days,  completed_at: Time.now - 1.day)

blood_request14 = Blood_request.create(user_id: user14.id, facility_id: facility14.id, blood_type:"A-", needed_by: "2025-12-26", status: "pending",  patient_name: user14.first_name,
                  patient_phone_number: user14.phone, message: "Accident case",    quantity: 1,   created_at: Time.now,     completed_at: nil)

blood_request15 = Blood_request.create(user_id: user15.id, facility_id: facility15.id, blood_type: "B-", needed_by: "2025-12-28",   status: "completed", patient_name: user14.first_name,
                  patient_phone_number: user15.phone,   message: "Scheduled surgery", quantity: 2, created_at: Time.now - 4.days, completed_at: Time.now - 2.days)

blood_requests16 = Blood_request.create(user_id; user16.id, facility_)
  {
    user_id: "user 016",
    facility_id: 16,
    blood_type: "AB+",
    needed_by: "2025-12-30",
    status: "pending",
    patient_name: "Priyanka Rai",
    patient_phone_number: "55234567",
    message: "Urgent transfusion",
    quantity: 1,
    created_at: Time.now,
    completed_at: nil
  },
  {
    user_id: "user 017",
    facility_id: 17,
    blood_type: "O-",
    needed_by: "2025-12-31",
    status: "completed",
    patient_name: "Rajesh Sharma",
    patient_phone_number: "56789012",
    message: "Post-surgery",
    quantity: 2,
    created_at: Time.now - 5.days,
    completed_at: Time.now - 2.days
  },
  {
    user_id: "user 018",
    facility_id: 18,
    blood_type: "A+",
    needed_by: "2025-12-27",
    status: "pending",
    patient_name: "Sunita Kapoor",
    patient_phone_number: "57654321",
    message: "Emergency transfusion",
    quantity: 1,
    created_at: Time.now,
    completed_at: nil
  },
  {
    user_id: "user 019",
    facility_id: 19,
    blood_type: "B+",
    needed_by: "2025-12-29",
    status: "completed",
    patient_name: "Manish Gupta",
    patient_phone_number: "58345678",
    message: "Scheduled transfusion",
    quantity: 3,
    created_at: Time.now - 6.days,
    completed_at: Time.now - 3.days
  },
  {
    user_id: "user 020",
    facility_id: 20,
    blood_type: "AB-",
    needed_by: "2025-12-23",
    status: "pending",
    patient_name: "Kavita Chopra",
    patient_phone_number: "59012345",
    message: "Urgent requirement",
    quantity: 1,
    created_at: Time.now,
    completed_at: nil
  },
  {
    user_id: "user 021",
    facility_id: 21,
    blood_type: "O+",
    needed_by: "2025-12-21",
    status: "completed",
    patient_name: "Amit Desai",
    patient_phone_number: "59876543",
    message: "Routine transfusion",
    quantity: 2,
    created_at: Time.now - 7.days,
    completed_at: Time.now - 4.days
  },
  {
    user_id: "user 022",
    facility_id: 22,
    blood_type: "A-",
    needed_by: "2025-12-19",
    status: "pending",
    patient_name: "Rina Patel",
    patient_phone_number: "50765432",
    message: "Emergency case",
    quantity: 1,
    created_at: Time.now,
    completed_at: nil
  },
  {
    user_id: "user 023",
    facility_id: 23,
    blood_type: "B-",
    needed_by: "2025-12-17",
    status: "completed",
    patient_name: "Vijay Nair",
    patient_phone_number: "51234567",
    message: "Scheduled surgery",
    quantity: 2,
    created_at: Time.now - 5.days,
    completed_at: Time.now - 2.days
  },
  {
    user_id: "user 024",
    facility_id: 24,
    blood_type: "AB+",
    needed_by: "2025-12-16",
    status: "pending",
    patient_name: "Nandini Rao",
    patient_phone_number: "51987654",
    message: "Urgent transfusion",
    quantity: 1,
    created_at: Time.now,
    completed_at: nil
  },
  {
    user_id: "user 025",
    facility_id: 25,
    blood_type: "O-",
    needed_by: "2025-12-14",
    status: "completed",
    patient_name: "Harish Mehta",
    patient_phone_number: "52345679",
    message: "Routine transfusion",
    quantity: 2,
    created_at: Time.now - 6.days,
    completed_at: Time.now - 3.days
  },
  {
    user_id: "user 026",
    facility_id: 26,
    blood_type: "A+",
    needed_by: "2025-12-13",
    status: "pending",
    patient_name: "Pooja Sharma",
    patient_phone_number: "53098765",
    message: "Accident case",
    quantity: 1,
    created_at: Time.now,
    completed_at: nil
  },
  {
    user_id: "user 027",
    facility_id: 27,
    blood_type: "B+",
    needed_by: "2025-12-12",
    status: "completed",
    patient_name: "Raj Chand",
    patient_phone_number: "54012345",
    message: "Scheduled transfusion",
    quantity: 2,
    created_at: Time.now - 3.days,
    completed_at: Time.now - 1.day
  }
]
