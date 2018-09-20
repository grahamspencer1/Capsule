User.destroy_all

# create the admin/superuser
User.create(
  name: 'Lorem',
  email: 'lorem@ipsum.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true
)