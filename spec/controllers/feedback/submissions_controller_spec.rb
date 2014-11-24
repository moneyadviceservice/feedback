require 'spec_helper'

describe Feedback::SubmissionsController do
  routes { Feedback::Engine.routes }

  describe 'GET #index' do
    it 'works' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    it 'sends an email' do
      expect do
        post :create, { submission: { body: 'make it better' } }
      end.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
