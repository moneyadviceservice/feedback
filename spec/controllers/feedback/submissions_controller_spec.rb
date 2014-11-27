require 'spec_helper'

describe Feedback::SubmissionsController do
  routes { Feedback::Engine.routes }

  describe 'GET #index' do

    it 'works' do
      get :index
      expect(response).to be_success
    end

    it 'assigns the referer to the submission' do
      request.env["HTTP_REFERER"] = "where_i_came_from"
      get :index
      expect(assigns(:submission).referer).to eq('where_i_came_from')
    end
  end

  describe 'POST #create' do
    it 'sends an email' do
      expect do
        post :create, { submission: { body: 'make it better' } }
      end.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it 'extracts the referer address from the post' do
      post :create, { submission:
        { body: 'make it better', referer: 'where_i_came_from'  } }
      expect(assigns(:referer)).to eq('where_i_came_from')
    end
  end
end
