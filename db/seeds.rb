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
  title: 'Tired but strong',
  content: "It was exactly what everyone warned me about. Exhausting, overwhelming, stressful, but enjoyable and a memorable experience at the same time.",
  private: false,
  bg_picture: BgPicture.first,
  user: User.first,
  mood: 'neutral',
  auto_mood: true,
  created_at: Time.now
)

Entry.create!(
  title: "I'm done!",
  content: "I feel so overwhelmed! I learned a lot from this course but there's still soooooo so so much more to explore. I'm really looking forward to my first job but I'm also pretty nervous about the whole job hunting experience. Outcomes is daunting too! I need to invent a time machine so that I can slow down time and learn how to code + network with people + retain sanity.",
  private: false,
  bg_picture: BgPicture.third,
  user: User.first,
  mood: 'negative',
  auto_mood: true,
  created_at: Time.now + rand(1..3).day
)

Entry.create!(
  title: "And what a journey its been...",
  content: "My oh my... Week 12... I've had about 27 dreams about code. Some days, I want to say \"hello world\", but instead the first thing that comes to mind is ruby. I really gotta CTRL+C that... it's messing with me. Anyway, time to .exit. See ya later :)",
  private: false,
  bg_picture: BgPicture.first,
  user: User.first,
  mood: 'neutral',
  auto_mood: true,
  created_at: Time.now + rand(1..3).day
)

Entry.create!(
  title: "To whom it may concern...",
  content: "It is I, the infamous Bathroom Bandit! The Flashing Flusher, The Stall Stripper, call me what you will, I have many a mooning moniker, and I'll be returning to a lascivious lavatory near you. Faris will never catch me. None of you will! BWAHAHAHA",
  private: false,
  bg_picture: BgPicture.third,
  user: User.first,
  mood: 'negative',
  auto_mood: true,
  created_at: Time.now + rand(1..3).day
)

Entry.create!(
  title: "It's the last day",
  content: "Has it really been three months? It was definitely fast-paced program. The instructors have warned us. I will need some time to just wind down and revisit old works. The next step is the scary part and there are still so many things to do. But I know I'll pull through, if I put in the effort and believe in myself!",
  private: false,
  bg_picture: BgPicture.third,
  user: User.first,
  mood: 'negative',
  auto_mood: true,
  created_at: Time.now + rand(1..3).day
)

Entry.create!(
  title: "Pizza and Cupcake Disaster",
  content: "Last week I wanted pizza but Faris was like no......the end. This week Faris brought us cupcakes....but they were squished....i'm traumatized. I don't feel good about Faris anymore.",
  private: false,
  bg_picture: BgPicture.second,
  user: User.first,
  mood: 'positive',
  auto_mood: true,
  created_at: Time.now + rand(1..3).day
)

Entry.create!(
  title: "I really love Tyler",
  content: "The first day I met Tyler I knew this was it. My life was not going to get any better ... ",
  private: false,
  bg_picture: BgPicture.second,
  user: User.first,
  mood: 'positive',
  auto_mood: true,
  created_at: Time.now + rand(1..3).day
)

Entry.create!(
  title: "I LIKE BIIIIGGGGGG",
  content: "BUTTS AND I CANNOT LIE
YO OTHER BROTHERS CAN'T DENY
WHEN A GURL WALKS IN
WITH AN ITTY BITTY WAIST
AND A ROUND THING IN YOUR SPACE
I .....

....

GO TO THIS AWESOME WEBSITE:

https://secure-hamlet-34582.herokuapp.com/

WHERE I UPLOAD THE DANKEST PROJECTS AND MEMES GALORE.

PS TYLER IS HOT.",
  private: false,
  bg_picture: BgPicture.second,
  user: User.first,
  mood: 'positive',
  auto_mood: true,
  created_at: Time.now + rand(1..3).day
)