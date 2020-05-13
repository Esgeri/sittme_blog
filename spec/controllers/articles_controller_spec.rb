require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:article) { create(:article) }

  describe 'GET #index' do
    let(:articles) { create_list(:article, 3) }

    before { get :index }

    it "populates an array of articles" do
      expect(assigns(:articles)).to match_array(articles)
    end

    it "renders the :index template" do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: article } }

    it "assigns the requested article to @article" do
      expect(assigns(:article)).to eq(article)
    end

    it "renders the :show template" do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    sign_in_user

    before { get :new }

    it "assigns a new Article to @article" do
      expect(assigns(:article)).to be_a_new(Article)
    end

    it "renders the :new template" do
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    sign_in_user

    before { get :edit, params: { id: article } }

    it "assigns a new Article to @article" do
      expect(assigns(:article)).to eq(article)
    end

    it "renders the :new template" do
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    sign_in_user

    context 'with valid attributes' do
      it 'saves the new article in the database' do
        expect do
          post :create, params: { article: attributes_for(:article) }
        end.to change(Article, :count).by(1)
      end

      it 'redirects to articles#show' do
        post :create, params: { article: attributes_for(:article) }
        expect(response).to redirect_to(article_path(assigns(:article)))
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new article in the database' do
        expect do
          post :create, params: { article: attributes_for(:invalid_article) }
        end.to_not change(Article, :count)
      end

      it 're-renders the :new template' do
        post :create, params: { article: attributes_for(:invalid_article) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    sign_in_user

    before :each do @article = create(:article) end

    context "valid attributes" do
      it "locates the requested @article" do
        patch :update, params: { id: @article, article: attributes_for(:article) }
        expect(assigns(:article)).to eq(@article)
      end

      it "changes @article's attributes" do
        patch :update, params: { id: @article,
          article: attributes_for(:article,
          title: 'New article title',
          description: 'New article description')
        }
        @article.reload
        expect(@article.title).to eq('New article title')
        expect(@article.description).to eq('New article description')
      end

      it "redirects to the updated article" do
        patch :update, params: { id: @article, article: attributes_for(:article) }
        expect(response).to redirect_to @article
      end
    end

    context "with invalid attributes" do
      it "does not change the article's attributes" do
        patch :update, params: { id: @article,
          article: attributes_for(:article,
          title: 'New article title',
          description: nil)
        }
        @article.reload
        expect(@article.title).not_to eq('New article title')
        expect(@article.description).to eq('TestDescription')
        end

      it "re-renders the :edit template" do
        patch :update, params: { id: @article, article: attributes_for(:invalid_article) }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    sign_in_user

    before :each do
      @article = create(:article)
    end

    it "deletes the article" do
      expect{
        delete :destroy, params: { id: @article }
      }.to change(Article,:count).by(-1)
    end

    it "redirects to articles#index" do
      delete :destroy, params: { id: @article }
      expect(response).to redirect_to articles_url
    end
  end
end
