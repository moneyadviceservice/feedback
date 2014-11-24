module Feedback
  class SubmissionMailer < ActionMailer::Base
    default from: 'notmonitored@notify.moneyadviceservice.org.uk'

    def feedback
      mail to: 'tools.help@moneyadviceservice.org.uk',
           subject: 'Welcome to My Awesome Site'
    end
  end
end
