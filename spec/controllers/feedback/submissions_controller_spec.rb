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

    it 'extracts the referer address from the post' do
      post :create, { submission:
        { body: 'make it better', referer: 'where_i_came_from'  } }
      expect(assigns(:submission).referer).to eq('where_i_came_from')
    end

    it 'adds user agent to submission' do
      post :create, { submission: { body: 'make it better' } }
      expect(assigns(:submission).user_agent).to eql('Rails Testing')
    end

    it 'adds source to submission' do
      post :create, { submission: { body: 'make it better', source: 'account' } }
      expect(assigns(:submission).source).to eql('account')
    end

    context 'when body is empty' do
      it 'renders form again' do
        post :create, { submission: { body: '' } }

        expect(response).to render_template('feedback/submissions/index')
      end
    end

    context 'sends' do
      it 'via delayed job' do
        expect do
          post :create, { submission: { body: 'make it better' } }
        end.to change { Delayed::Job.count }.by(1)
      end

      it 'using the frontend specific queue' do
        post :create, { submission: { body: 'make it better' } }
        expect(Delayed::Job.last.queue).to eql('frontend_email')
      end

      it 'an email' do
        expect do
          post :create, { submission: { body: 'make it better' } }
          Delayed::Job.last.payload_object.perform
        end.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end
  
  end
end
