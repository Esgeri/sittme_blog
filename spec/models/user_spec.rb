require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  context 'associations' do
    it { is_expected.to have_many(:articles).dependent(:destroy) }
  end

  context 'creating object' do
    let(:user) { create(:user) }
    let(:invalid_user) { build(:user, username: nil) }

    it "is valid with a username, password and email" do
      expect(user).to be_valid
    end

    it "is invalid without a username" do
      invalid_user.valid?
      expect(invalid_user.errors[:username]).to include("can't be blank")
    end

    it "is not include username blank message" do
      user.valid?
      expect(user.errors[:username]).not_to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      User.create(
      username: 'Joe', password: '123456',
      email: 'tester@example.com'
      )
      user = User.new(
      username: 'Jane', password: '123456',
      email: 'tester@example.com'
      )
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end

    it "returns a user's name as a string" do
      expect(user.username).to eq 'TestUser'
    end
  end

  describe 'scope' do
    describe '#on_created_at' do
      it '#on_created_at' do
        User.on_created_at.each do |user|
          expect(user.created_at.to_s).to eq(Time.now.utc.to_s)
        end
      end
    end
  end
end
