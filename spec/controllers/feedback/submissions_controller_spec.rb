require 'spec_helper'

describe Feedback::SubmissionsController do
  routes { Feedback::Engine.routes }

  describe 'GET #index' do
    it 'works' do
      get :index, locale: :en
      expect(response).to be_success
    end

    it 'assigns the referer to the submission' do
      request.env["HTTP_REFERER"] = "where_i_came_from"
      get :index, locale: :en
      expect(assigns(:submission).referer).to eq('where_i_came_from')
    end
  end

  describe 'POST #create' do

    it 'extracts the referer address from the post' do
      post :create, submission:
        { body: 'make it better', referer: 'where_i_came_from' }, locale: :en
      expect(assigns(:submission).referer).to eq('where_i_came_from')
    end

    it 'adds user agent to submission' do
      post :create, submission: { body: 'make it better' }, locale: :en
      expect(assigns(:submission).user_agent).to eql('Rails Testing')
    end

    it 'adds source to submission' do
      post :create, submission: { body: 'make it better', source: 'account' }, locale: :en
      expect(assigns(:submission).source).to eql('account')
    end

    it 'adds the choice of useful or not useful to submission' do
      post :create, submission: { body: 'make it better', useful: 'yes'}, locale: :en
      expect(assigns(:submission).useful).to eql('yes')
    end

    context 'when body is empty' do
      it 'renders form again' do
        post :create, submission: { body: '' }, locale: :en

        expect(response).to render_template('feedback/submissions/index')
      end
    end

    context 'sends' do
      it 'via delayed job' do
        expect do
          post :create, submission: { body: 'make it better' }, locale: :en
        end.to change { Delayed::Job.count }.by(1)
      end

      it 'using the frontend specific queue' do
        post :create, submission: { body: 'make it better' }, locale: :en
        expect(Delayed::Job.last.queue).to eql('frontend_email')
      end

      it 'an email' do
        expect do
          post :create, submission: { body: 'make it better' }, locale: :en
          Delayed::Job.last.payload_object.perform
        end.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end
  
  end
end
