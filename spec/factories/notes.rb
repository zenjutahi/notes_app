FactoryBot.define do
    factory :note do
        association :category, factory: :category
        name { Faker::Food.ingredient }
        description { Faker::Food.description }
    end
end
