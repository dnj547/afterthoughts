require 'rails_helper'

dan = User.create!(username:"Dan",password:"123")
c1 = Calendar.create!(user:dan,name:"Social")

RSpec.describe Event, :type => :model do

  subject {
      described_class.new(
        calendar_id: 1,
        visibility: "public",
        organizer: "Dans Mom",
        title: "Shopping trip",
        description: "blah",
        start: DateTime.new(2019,5,5,12),
        end: DateTime.new(2019,5,5,17),
        location: "home"
      )
    }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without an organizer" do
      subject.organizer = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a start date/time" do
      subject.start = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an end date/time" do
      subject.end = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if the start is after the end" do
      subject.start = DateTime.now
      expect(subject).to_not be_valid
    end

  end

  # describe "Associations" do
  #   it "has many calendars" do
  #     assc = described_class.reflect_on_association(:calendars)
  #     expect(assc.macro).to eq :has_many
  #   end
  #
  #   it "has many events" do
  #     assc = described_class.reflect_on_association(:events)
  #     expect(assc.macro).to eq :has_many
  #   end
  #
  #   it "has many afterthoughts" do
  #     assc = described_class.reflect_on_association(:afterthoughts)
  #     expect(assc.macro).to eq :has_many
  #   end
  # end

end
