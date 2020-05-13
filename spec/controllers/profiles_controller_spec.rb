require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe 'GET #index' do
    sign_in_user

    let(:users) { create_list(:user, 3) }

    before { get :index }

    it "populates an array of users" do
      expect(assigns(:users)).to match_array(users)
    end

    it "renders the :index template" do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    sign_in_user

    let(:user) { create(:user) }

    before { get :show, params: { id: user } }

    it "assigns the requested user to @user" do
      expect(assigns(:user)).to eq(user)
    end

    it "renders the :show template" do
      expect(response).to render_template(:show)
    end
  end
end
