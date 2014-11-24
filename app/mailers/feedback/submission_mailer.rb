module Feedback
  class SubmissionMailer < ActionMailer::Base
    default from: 'notmonitored@notify.moneyadviceservice.org.uk'

    def feedback
      mail to: 'tools.help@moneyadviceservice.org.uk',
           subject: 'Feedback from Account Page'
    end
  end
end
