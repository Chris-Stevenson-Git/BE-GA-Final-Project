print "Creating Users..."
User.destroy_all

print "Creating Users..."
User.destroy_all

u1 = User.create!(
  first_name:'Chris',
  last_name: 'Stevenson',
  email: 'chris@ga.co',
  password: 'chicken',
  admin: true
)
u1 = User.create!(
  first_name:'Luke',
  last_name: 'Hammer',
  email: 'luke@ga.co',
  password: 'chicken',
  admin: false
)
u1 = User.create!(
  first_name:'Zara',
  last_name: 'Isp',
  email: 'zara@ga.co',
  password: 'chicken',
  admin: false
)


puts "Created #{ User.count } users:"
