require 'rails_helper'

describe RankingsController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    it "renders the :show template" do
      ranking = create(:ranking)
      get :show, params: {id: ranking}
      expect(response).to render_template :show
    end
  end

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
