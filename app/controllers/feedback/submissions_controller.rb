module Feedback
  class SubmissionsController < ApplicationController
    def index
      @submission = Submission.new
    end

    def create
      @submission = Submission.new(params[:submission])

      Feedback::SubmissionMailer.feedback(@submission).deliver

      redirect_to submissions_path
    end
  end
end
