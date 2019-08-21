require 'rails_helper'

describe ItemsController do
  describe 'GET #new' do
    it "renders the :new template" do
      ranking = create(:ranking)
      get :new, params: {ranking_id: ranking}
      expect(response).to render_template :new
    end
  end
end
