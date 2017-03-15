require 'rails_helper'

describe "show a single event" do
  let!(:event){create :event}
  it "shows the details of a single event" do
    visit event_path(event)
    expect(page).to have_text("€#{event.price}")
    expect(page).to have_text("Capacity: #{event.capacity}")

  end
end
