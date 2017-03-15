require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it "is invalid if the name is blank" do
      event = Event.new(name:nil)
      event.valid?
      expect(event.errors).to have_key(:name)
    end
    it "is invalid if description is blank" do
      event = Event.new(description:nil)
      event.valid?
      expect(event.errors).to have_key(:description)
    end
    it "is invalid if description is longer than 500 chars" do
      event = Event.new(description: "a"*501)
      event.valid?
      expect(event.errors).to have_key(:description)
    end
  end
  describe "#free?" do
    it "should return true if an event is free" do
      event = Event.new(price:0)
      expect(event.free?).to eq(true)
    end
    it "should return false if an event is not free" do
      event = Event.new(price:1)
      expect(event.free?).to eq(false)
    end
  end
  describe ".order_by_price" do
    let!(:cheap_event) {create :event, price:100}
    let!(:expensive_event) {create :event, price:1000}
    let!(:middling_event) {create :event, price:200}

    it "should return an array ordered by price" do
      expect(Event.order_by_price).to eq([cheap_event, middling_event, expensive_event])
    end
  end
  describe "association with user" do
    let!(:user) {create :user}

    it "belongs to a user" do
      event = user.events.new(name:"Awesome party, bro!")
      expect(event.user).to eq(user)
    end
  end
  describe "many to many association with category" do
    let(:event) {create :event}

    let(:category1){create :category, name:"Rave", events:[event]}
    let(:category2){create :category, name:"Techno", events:[event]}
    let(:category3){create :category, name:"House", events:[event]}

    it "has categories" do
      expect(event.categories).to include(category1)
      expect(event.categories).to include(category2)
      expect(event.categories).to include(category3)
    end
  end

end
