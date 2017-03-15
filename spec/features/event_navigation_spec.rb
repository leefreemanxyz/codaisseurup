require 'rails_helper'

describe "navigate between event page and events index for logged in user" do
  before {login_as user}

  let(:user) {create :user, email:"current@user.com"}

  let!(:event){ create :event, name: "Event 1", user: user}

  it "should return to events index when back button is pressed" do
    visit event_path(event)
    click_link "Back"
    expect(current_path).to eq(events_path)
  end

  it "should navigate to event when view button is pressed" do
    visit events_path
    click_link "View"
    expect(current_path).to eq(event_path(event))
  end

end
