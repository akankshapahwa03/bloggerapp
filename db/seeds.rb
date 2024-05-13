Category.create(name: 'Fiction')
Category.create(name: 'Non-Fiction')
Category.create(name: 'Biography')


User.create! do |u|
  u.email = 'admin@test.com'
  u.password = 'password'
  u.admin = true
end