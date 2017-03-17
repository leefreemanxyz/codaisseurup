Photo.delete_all
Registration.delete_all
Category.delete_all
Event.delete_all
Profile.delete_all
User.delete_all

  miriam = User.create!(
   email: "miriam@codaisseurup.com",
   password: "abcd1234",
 )

 #photos
 photo1 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyb4pntz0/image/upload/v1489670938/images_gefchg.jpg")
 photo2 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyb4pntz0/image/upload/v1489670938/images_9_o83xwk.jpg")
 photo3 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyb4pntz0/image/upload/v1489670938/images_8_djmyet.jpg")
 photo4 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyb4pntz0/image/upload/v1489670938/images_7_nomxp1.jpg")
 photo5 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyb4pntz0/image/upload/v1489670938/images_5_udikld.jpg")
 photo6 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyb4pntz0/image/upload/v1489670938/images_4_mwsimd.jpg")
 photo7 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyb4pntz0/image/upload/v1489670938/images_3_dwuk94.jpg")
 photo8 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyb4pntz0/image/upload/v1489670938/images_2_af2ziu.jpg")
 photo9 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyb4pntz0/image/upload/v1489670938/images_1_bbjlel.jpg")


 event1 = Event.create!(
   name: "Monthly Yoga Weekend",
   description: "Let's come together and practice some asanas together in the woods!",
   location: "Amsterdam",
   includes_food: false,
   includes_drinks: true,
   price: 10.00,
   starts_at: 10.days.from_now,
   ends_at: 12.days.from_now,
   capacity: 100,
   active: true,
   user: miriam,
   photos:[photo1,photo2,photo3]
 )
 event2 = Event.create!(
   name: "Annual Yoga retreat",
   description: "Let's come together and practice some asanas together in the woods!",
   location: "Amsterdam Bos",
   includes_food: true,
   includes_drinks: true,
   price: 10.00,
   starts_at: 120.days.from_now,
   ends_at: 132.days.from_now,
   capacity: 1000,
   active: true,
   user: miriam,
   photos: [photo4,photo5,photo6]
 )
 event3 = Event.create!(
   name: "Biennial Yoga retreat",
   description: "Let's come together and practice some asanas together in the woods!",
   location: "Frisland",
   includes_food: true,
   includes_drinks: false,
   price: 10.00,
   starts_at: 1520.days.from_now,
   ends_at: 1522.days.from_now,
   capacity: 2000,
   active: true,
   user: miriam,
   photos: [photo7,photo8,photo9]
 )

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

 event1.categories << Category.find_by(name: "Outdoors & Adventure")
 event1.categories << Category.find_by(name: "Sports & Fitness")
 event2.categories << Category.find_by(name: "Tech")
 event2.categories << Category.find_by(name: "Family")
 event3.categories << Category.find_by(name: "Learning")
 event3.categories << Category.find_by(name: "Family")

Registration.create(user:miriam, event: event1, status:"Attending", price:20, guests_count:0)
