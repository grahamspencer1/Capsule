User.destroy_all
Entry.destroy_all
BgPicture.destroy_all

# create the admin/superuser
User.create!(
  name: 'Lorem',
  email: 'lorem@ipsum.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true
)

BgPicture.create!(
  mood: 'neutral',
  image: 'dewang-gupta-570854-unsplash.jpg'
)

BgPicture.create!(
  mood: 'positive',
  image: 'adi-goldstein-717512-unsplash.jpg'
)

BgPicture.create!(
  mood: 'negative',
  image: 'eberhard-grossgasteiger-1061663-unsplash.jpg'
)

Entry.create!(
  title: 'Hello World',
  content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  private: false,
  bg_picture: BgPicture.first,
  user: User.first,
  mood: 'neutral',
  auto_mood: true
)

Entry.create!(
  title: 'Goodbye World',
  content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  private: true,
  bg_picture: BgPicture.limit(3).last,
  user: User.first,
  mood: 'negative',
  auto_mood: true
)
