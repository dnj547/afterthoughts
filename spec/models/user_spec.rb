require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "Validations" do
    it "is valid with valid attributes" do
      subject.username = "Dan"
      subject.password = "pw123"
      expect(subject).to be_valid
    end

    it "is not valid without a username" do
      subject.username = nil
      subject.password = "pw123"
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.username = "Dan"
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "encrypts password" do
      subject.username = "Dan"
      subject.password = "pw123"
      subject.save
      expect(subject.password) != "pw123"
    end
  end

  describe "Associations" do
    it "has many calendars" do
      assc = described_class.reflect_on_association(:calendars)
      expect(assc.macro).to eq :has_many
    end

    it "has many events" do
      assc = described_class.reflect_on_association(:events)
      expect(assc.macro).to eq :has_many
    end

    it "has many afterthoughts" do
      assc = described_class.reflect_on_association(:afterthoughts)
      expect(assc.macro).to eq :has_many
    end
  end

end
