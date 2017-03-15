FactoryGirl.define do
  factory :event do
    name  "Best party in the world"
    description {Faker::Lorem.sentence(40)}
    location {Faker::Address.city}
    price {Faker::Commerce.price}
    capacity  10
    includes_food true
    includes_drinks true
    starts_at   {Faker::Date.between(10.days.from_now, 12.days.from_now)}
    ends_at   {Faker::Date.between(12.days.from_now, 15.days.from_now)}
    user    {build(:user)}
  end


trait :active do
  active true
end

trait :inactive do
  active false
end
end
