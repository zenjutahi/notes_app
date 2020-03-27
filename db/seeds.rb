24.times do
    User.create(
        username: Faker::Internet.username,
        email: Faker::Internet.email,
        password: "mysecret"
    )
end

users_ids = User.all.pluck(:id)
users_ids.each do |user_id|
    15.times do
        Category.create(
            name: Faker::Movie,
            user_id: user_id
        )
    end
end

categories_ids = Category.all.pluck(:id)
categories_ids.each do |category_id|
    15.times do
        Note.create(
            title: Faker::Movies::BackToTheFuture,
            description: Faker::Movie.quote,
            category_id: category_id
        )
    end
end
