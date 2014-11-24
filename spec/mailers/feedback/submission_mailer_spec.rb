require 'spec_helper'

module Feedback
  describe SubmissionMailer do
    describe '#feedback' do
      let(:body) { 'this is some feedback' }
      let(:submission) { Submission.new(body: body) }

      it 'sends emails' do
        expect do
          described_class.feedback(submission).deliver
        end.to change { ActionMailer::Base.deliveries.count }.by(1)
      end

      it 'emails from notmonitored@notify.moneyadviceservice.org.uk' do
        described_class.feedback(submission).deliver
        email = ActionMailer::Base.deliveries.last
        expect(email.from).to include('notmonitored@notify.moneyadviceservice.org.uk')
      end

      it 'emails to tools.help@moneyadviceservice.org.uk' do
        described_class.feedback(submission).deliver
        email = ActionMailer::Base.deliveries.last
        expect(email.to).to include('tools.help@moneyadviceservice.org.uk')
      end

      it 'Feedback from Account Page' do
        described_class.feedback(submission).deliver
        email = ActionMailer::Base.deliveries.last
        expect(email.subject).to include('Feedback from Account Page')
      end

      it 'adds submission to the email body' do
        described_class.feedback(submission).deliver
        email = ActionMailer::Base.deliveries.last
        expect(email.body.raw_source).to include('this is some feedback')
      end
    end
  end
end
