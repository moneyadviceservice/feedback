module Feedback
  class SubmissionsController < ApplicationController
    def index
      @submission = Submission.new
    end

    def create
      @submission = Submission.new(submission_params)

      Feedback::SubmissionMailer.feedback(@submission).deliver
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
