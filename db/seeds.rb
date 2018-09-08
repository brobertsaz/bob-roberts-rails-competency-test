categories = %w[Tech Sport Lifestyle Politics]

5.times do
  User.create(
    email: Faker::Internet.free_email,
    password: 'Password1',
    role: :editor
  )
end

User.create(email: 'editor@example.com', password: 'Password1', role: :editor)

30.times do
  Article.create(
    user: User.all.sample,
    category: categories.sample,
    title: Faker::Lorem.sentence(4),
    content: Faker::Lorem.paragraph(4)
    )
  end

User.create(email: 'admin@example.com', password: 'Password1', role: :admin)