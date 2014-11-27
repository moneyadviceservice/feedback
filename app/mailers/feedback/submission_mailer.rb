module Feedback
  class SubmissionMailer < ActionMailer::Base
    default from: 'notmonitored@notify.moneyadviceservice.org.uk'

    def feedback(submission)
      @submission = submission

      mail to: 'tools.help@moneyadviceservice.org.uk',
           subject: "Feedback from #{subject_from_submission(@submission)} Page"
    end

    def subject_from_submission(submission)
      submission.source.try(:humanize) || 'Unknown'
    end
  end
end
