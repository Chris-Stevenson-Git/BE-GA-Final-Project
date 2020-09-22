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
  name: 'Stevenson Household'
)
h2 = Household.create(
  name: 'Textchimp Treehouse'
)
h3 = Household.create(
  name: 'Z Space'
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

puts "Created #{ Chore.count } Chores.."
