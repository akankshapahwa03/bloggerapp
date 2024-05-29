Category.find_or_create_by(name: 'Fiction')
Category.find_or_create_by(name: 'Non-Fiction')
Category.find_or_create_by(name: 'Biography')
Category.find_or_create_by(name: 'Technology')
Category.find_or_create_by(name: 'Business')
Category.find_or_create_by(name: 'Lifestyle')
Category.find_or_create_by(name: 'Food')
Category.find_or_create_by(name: 'Travel')

User.create! (
  name = 'Admin'
  email = 'admin@test.com'
  password = 'password'
  admin = true
)
end