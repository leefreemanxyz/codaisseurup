require 'rails_helper'

describe 'List events of current user' do
  before {login_as user}
  let(:other_user) {create :user, email:"other@user.com"}
  let(:user) {create :user, email:"current@user.com"}

  let!(:event1){ create :event, name: "Event 1", user: user}
  let!(:event2){ create :event, name: "Event 2", user: user}
  let!(:event3){ create :event, name: "Event 3", user: other_user}

  it "shows all the events of the logged in user" do
    visit events_url

    expect(page).to have_text("Event 1")
    expect(page).to have_text("Event 2")
  end

  it "doesn't show the events of other users" do
    visit events_url
    expect(page).not_to have_text("Event 3")
  end
end
