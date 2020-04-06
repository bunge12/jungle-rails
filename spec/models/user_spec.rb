require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(
      first_name: "Testing",
      last_name: "Something",
      email: "test@test.com",
      password: "qwerty"
    )
  }
  describe 'Validations' do
    it "is valid given correct parameters" do
      expect(subject).to be_valid
    end
    it "must be created with password and password_confirmation fields"
    it "must contain a unique case insensitive email"
    it "must contain first, last name, and email"
    it "must contain password of certain length"
  end
end
