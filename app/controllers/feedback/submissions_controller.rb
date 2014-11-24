module Feedback
  class SubmissionsController < ApplicationController
    def index
    end

    def create
      Feedback::SubmissionMailer.feedback.deliver

      redirect_to submissions_path
    end
  end
end
