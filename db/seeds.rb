require "factory_girl_rails"

Category.destroy_all
  Event.destroy_all
  User.destroy_all
10.times do
  FactoryGirl.create :event
end





 Category.create!([
   { name: "Movements" },
   { name: "Outdoors & Adventure" },
   { name: "Tech" },
   { name: "Family" },
   { name: "Health & Wellness" },
   { name: "Sports & Fitness" },
   { name: "Learning" },
   { name: "Photography" },
   { name: "Food & Drink" },
 ])
