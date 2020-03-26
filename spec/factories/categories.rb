FactoryBot.define do
    factory :category do
        association :user, factory: :user
        name { Faker::Food.dish }
    end
end
