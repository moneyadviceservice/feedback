module Feedback
  class SubmissionsController < Feedback::ApplicationController
    def index
      @submission = Submission.new
      @submission.referer = request.referer
      @submission.source = params[:source]
    end

    def create
      @submission = Submission.new(submission_params)

      if @submission.valid?
        Feedback::SubmissionMailer.delay(queue: 'frontend_email').feedback(@submission)
      else
        render :index
      end
    end

    private

    def submission_params
      params[:submission].merge(user_agent: user_agent)
    end

    def user_agent
      request.env['HTTP_USER_AGENT']
    end
  end
end
