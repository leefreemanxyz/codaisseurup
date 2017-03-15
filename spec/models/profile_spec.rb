require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe ".by_letter" do
    subject { Profile.by_letter("S") }

    let!(:profile1) { create :profile, first_name: "Swander" }
    let!(:profile2) { create :profile, first_name: "Stefan" }
    let!(:profile3) { create :profile, first_name: "Wouter" }

    it "returns profiles that start with the right letter" do
      expect(subject).to match_array [profile1, profile2]
    end

    it "does not return profiles that start with the wrong letter" do
      expect(subject).not_to include profile3
    end
end
end
