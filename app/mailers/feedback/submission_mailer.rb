module Feedback
  class SubmissionMailer < ActionMailer::Base
    default from: 'notmonitored@notify.moneyadviceservice.org.uk'

    def feedback(submission)
      @submission = submission

      mail to: 'tools.help@moneyadviceservice.org.uk',
           subject: 'Feedback from Account Page'
    end
  end
end
