module Feedback
  class SubmissionsController < ApplicationController
    def index
      @submission = Submission.new
      @submission.referer = request.referer
    end

    def create
      @submission = Submission.new(params[:submission])
      @referer = @submission.referer
      Feedback::SubmissionMailer.feedback(@submission).deliver
    end
  end
end
