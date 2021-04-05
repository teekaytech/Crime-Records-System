# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

`rails db:drop`
`rails db:create`
`rails db:migrate`

user1 = User.create!(
  email: 'admin@test.com',
  password: 'password',
  admin: true,
  firstname: 'Taofeek',
  lastname: 'Olalere',
  gender: 'Male',
  phone: '07085516354',
  address: 'Lagos, Nigeria',
  avatar: 'npf.png'
)

user2 = User.create!(
  email: 'police@test.com',
  password: 'password',
  admin: false,
  firstname: 'Lekan',
  lastname: 'Johnson',
  gender: 'Male',
  phone: '09077276262',
  address: 'Orile Iganmu, Lagos',
  avatar: 'npf.png'
)

cat1 = Category.create!(user: user1, name: 'Financial')
cat2 = Category.create!(user: user1, name: 'Driving Under the Influence')

Complainant.create!(
  user: user1,
  firstname: 'Akpabio',
  surname: 'Johnson',
  email: 'complainant1@test.com',
  dob: Date.today,
  nationality: 'Nigerian',
  address: 'Agege, Lagos',
  occupation: 'Accountant',
  phone: '08177377383',
  gender: 'Male'
  )

c1 = Complainant.create!(
  firstname: 'Idris',
  surname: 'Ademola',
  email: 'complainant2@test.com',
  dob: Date.today,
  nationality: 'Nigerian',
  address: 'Shomolu, Lagos',
  occupation: 'Doctor',
  phone: '08477377383',
  gender: 'Male',
  user: user1
)

Complainant.create!(
  firstname: 'Fatoki',
  surname: 'Peters',
  email: 'complainant3@test.com',
  dob: Date.today,
  nationality: 'Nigerian',
  address: 'Oshodi, Lagos',
  occupation: 'Cobbler',
  phone: '08477371183',
  gender: 'Male',
  user: user2
)

FirstInformationReport.create!(
  offense: 'Illegal possession of firearms',
  date: Date.today,
  location: 'Ijegun',
  suspect_details: 'One man named Adebayo Williams with Toyota Camry car, plate no: IKJ123LG',
  user: user1,
  complainant: c1
)

crime1 = Crime.create!(
  accuser: 'Ademola Adeleke',
  accused: 'Junior Francis',
  unknown_others: 'Driver, Gateman',
  date: Date.today,
  statements: 'Statement story goes here...',
  user: user1
)

crime2 = Crime.create!(
  accuser: 'Oluwatobi Grace',
  accused: 'Salaam Peace',
  unknown_others: 'N/A',
  date: Date.today,
  statements: 'Statement story goes here...',
  user: user2
)

CrimeCategory.create!(crime: crime1, category: cat1)
CrimeCategory.create!(crime: crime1, category: cat2)
CrimeCategory.create!(crime: crime2, category: cat1)
