# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Entry.create(
  title: "Fisrt Day",
  content: "This is my first entry",
  user_id: "1"
)

User.create(
  name: "Jo",
  email: "jo@test.com",
  password: "abcd12134",
  )
