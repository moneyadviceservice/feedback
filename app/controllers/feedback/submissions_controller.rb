module Feedback
  class SubmissionsController < ApplicationController
    def index
      @submission = Submission.new
      @submission.referer = request.referer
    end

    def create
      @submission = Submission.new(submission_params)

      @referer = @submission.referer

      if @submission.valid?
        Feedback::SubmissionMailer.feedback(@submission).deliver
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
