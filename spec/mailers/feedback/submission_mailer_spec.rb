require 'spec_helper'

describe Feedback::SubmissionMailer do
  describe '#feedback' do
    it 'sends emails' do
      expect do
        described_class.feedback.deliver
      end.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it 'emails from notmonitored@notify.moneyadviceservice.org.uk' do
      described_class.feedback.deliver
      email = ActionMailer::Base.deliveries.last
      expect(email.from).to include('notmonitored@notify.moneyadviceservice.org.uk')
    end

    it 'emails to tools.help@moneyadviceservice.org.uk' do
      described_class.feedback.deliver
      email = ActionMailer::Base.deliveries.last
      expect(email.to).to include('tools.help@moneyadviceservice.org.uk')
    end

    it 'Feedback from Account Page' do
      described_class.feedback.deliver
      email = ActionMailer::Base.deliveries.last
      expect(email.subject).to include('Feedback from Account Page')
    end
  end
end
