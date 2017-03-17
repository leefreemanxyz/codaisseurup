require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associated with event" do
    let(:user) {create :user}
    let!(:event){create :event, user: user}
    it "has many events" do
      event1 = user.events.new(name: "Xmas party")
      event2 = user.events.new(name: "NYE party")

      expect(user.events).to include(event1)
      expect(user.events).to include(event2)
    end
    it "cascades event deletions" do
      expect {user.destroy}.to change(Event, :count).by(-1)
    end
  end
  describe "associated with registration" do
    let(:guest_user) {create :user, email:"guest@user.com"}
    let(:host_user) {create :user, email:"host@user.com"}

    let!(:event){ create :event, user: host_user}
    let!(:registration) {create :registration, event: event, user: guest_user }

    it "has events" do
      expect(guest_user.registered_events).to include(event)
    end
  end
end
