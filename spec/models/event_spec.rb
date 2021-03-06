require 'rails_helper'

RSpec.describe Event, type: :model do
    describe 'validations' do
        it 'is invalid if the name is blank' do
            event = Event.new(name: nil)
            event.valid?
            expect(event.errors).to have_key(:name)
        end
        it 'is invalid if description is blank' do
            event = Event.new(description: nil)
            event.valid?
            expect(event.errors).to have_key(:description)
        end
        it 'is invalid if description is longer than 500 chars' do
            event = Event.new(description: 'a' * 501)
            event.valid?
            expect(event.errors).to have_key(:description)
        end
    end
    describe '#free?' do
        it 'should return true if an event is free' do
            event = Event.new(price: 0)
            expect(event.free?).to eq(true)
        end
        it 'should return false if an event is not free' do
            event = Event.new(price: 1)
            expect(event.free?).to eq(false)
        end
    end
    describe '.order_by_price' do
        let!(:cheap_event) { create :event, price: 100 }
        let!(:expensive_event) { create :event, price: 1000 }
        let!(:middling_event) { create :event, price: 200 }

        it 'should return an array ordered by price' do
            expect(Event.order_by_price).to eq([cheap_event, middling_event, expensive_event])
        end
    end
    describe 'association with user' do
        let!(:user) { create :user }

        it 'belongs to a user' do
            event = user.events.new(name: 'Awesome party, bro!')
            expect(event.user).to eq(user)
        end
    end
    describe 'many to many association with category' do
        let(:event) { create :event }

        let(:category1) { create :category, name: 'Rave', events: [event] }
        let(:category2) { create :category, name: 'Techno', events: [event] }
        let(:category3) { create :category, name: 'House', events: [event] }

        it 'has categories' do
            expect(event.categories).to include(category1)
            expect(event.categories).to include(category2)
            expect(event.categories).to include(category3)
        end
    end

    describe 'association with registration' do
      let(:guest_user) {create :user, email:"guest@user.com"}
      let(:host_user) {create :user, email:"host@user.com"}

      let!(:event){ create :event, user: host_user}
      let!(:registration) {create :registration, event: event, user: guest_user }

      it "has guests" do
        expect(event.guests).to include(guest_user)
      end
    end
    describe "filters" do
      let!(:event1) {create :event, name:"a", active:true}
      let!(:event2) {create :event, name:"c", active:true}
      let!(:event3) {create :event, name:"b", active:false}
      it "returns events alphbetically" do
        expect(Event.alphabetical).to eq([event1,event3,event2])
      end
      it "returns only published events" do
        expect(Event.published).to contain_exactly(event1,event2)
      end
    end
end
