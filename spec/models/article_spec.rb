require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'scope' do
    describe '#on_created_at' do
      it '#on_created_at' do
        Article.on_created_at.each do |article|
          expect(article.created_at.to_s).to eq(Time.now.utc.to_s)
        end
      end
    end
  end

  context 'creating object' do
    let(:article) { create(:article) }
    let(:invalid_title) { build(:article, title: nil) }
    let(:invalid_desc) { build(:article, description: nil) }

    it "is valid with a username, password and email" do
      expect(article).to be_valid
    end

    it "is invalid without a title" do
      invalid_title.valid?
      expect(invalid_title.errors[:title]).to include("can't be blank")
    end

    it "is invalid without a description" do
      invalid_desc.valid?
      expect(invalid_desc.errors[:description]).to include("can't be blank")
    end

    it "is not include article blank message" do
      article.valid?
      expect(article.errors[:title]).not_to include("can't be blank")
      expect(article.errors[:description]).not_to include("can't be blank")
    end

    it "returns a article's fields as a string" do
      expect(article.title).to eq 'TestTitle'
      expect(article.description).to eq 'TestDescription'
    end
  end
end
