FactoryBot.define do
    factory :note do
        association :category, factory: :category
        name { Faker::Movies::BackToTheFuture }
        description { Faker::Movies::BackToTheFuture.quote }
    end
end
