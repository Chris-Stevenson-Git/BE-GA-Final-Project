print "Creating Users..."
User.destroy_all

u1 = User.create!(
  first_name:'Chris',
  last_name: 'Stevenson',
  email: 'chris@ga.co',
  password: 'chicken',
  admin: true
)
u2 = User.create!(
  first_name:'Maddy',
  last_name: 'Stevenson',
  email: 'maddy@ga.co',
  password: 'chicken',
  admin: false
)
u3 = User.create!(
  first_name:'Luke',
  last_name: 'Hammer',
  email: 'luke@ga.co',
  password: 'chicken',
  admin: false
)
u4 = User.create!(
  first_name:'Zara',
  last_name: 'Isp',
  email: 'zara@ga.co',
  password: 'chicken',
  admin: false
)

puts "Created #{ User.count } users.."

puts ''

print "Creating Households..."
Household.destroy_all

h1 = Household.create(
  name: 'Stevenson Household',
  owner: u1.id
)
h2 = Household.create(
  name: 'Textchimp Treehouse',
  owner: u3.id
)
h3 = Household.create(
  name: 'Z Space',
  owner: u4.id
)

puts "Created #{ Household.count } Households.."

puts ''

puts 'Creating Chores....'
Chore.destroy_all

c1 = Chore.create(
  name: 'Wash the dishes',
  location: 'Kitchen',
  est_time: 15,
  user_id: u1.id,
  household_id: h1.id,
  frequency: 1
)
c2 = Chore.create(
  name: 'Mow the lawn',
  location: 'Outside',
  est_time: 15,
  user_id: u1.id,
  household_id: h1.id,
  frequency: 1
)
c3 = Chore.create(
  name: 'Shampoo the dog',
  location: 'Kitchen',
  est_time: 15,
  user_id: u2.id,
  household_id: h1.id,
  frequency: 1
)

puts "Created #{ Chore.count } Chores.."


puts 'Associating households with users'

h1.users << u1 << u2
h2.users << u3 << u1
h3.users << u4
