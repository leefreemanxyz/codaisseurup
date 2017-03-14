User.destroy_all

miriam = User.create(email: "miriam@codaisseurup.com", password: "abcd1234")

event = Event.create({name:"Best party", description:"This is the party to end all parties", location:"World's smallest disco, TQ", price:15.0, capacity:20, includes_food:true, includes_drinks:true, starts_at:DateTime.new(2017,9,1,17), ends_at:DateTime.new(2017,9,1,19), active:true, user:miriam})
