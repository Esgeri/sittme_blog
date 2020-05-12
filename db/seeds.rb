test_user = User.create(
  username: 'Test user',
  email: 'user@test.com',
  password: '123456',
  password_confirmation: '123456'
)

test_user.articles.create({
  title: 'The Make A Statement Headline',
  description: 'Sometimes we get writers block and can’t think of a clever headline… This is where making a direct statement is the easiest and most effective way to engage your reader.'
})

10.times do |n|
  user = User.create(
    username: (Faker::Name.name),
    email: "user#{n}@test.com",
    password: '123456',
    password_confirmation: '123456'
  )

  15.times do
    user.articles.create({title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs})
  end
end
