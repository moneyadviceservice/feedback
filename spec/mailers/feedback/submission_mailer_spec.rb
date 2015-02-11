require 'spec_helper'

module Feedback
  describe SubmissionMailer do
    describe '#feedback' do
      let(:body) { 'this is some feedback' }
      let(:user_agent) { 'some user agent' }
      let(:referer) { 'where_i_came_from'}
      let(:source) { 'account'}
      let(:useful) { 'yes'}
      let(:submission) { Submission.new(body: body, user_agent: user_agent, referer: referer, source: source, useful: useful) }

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

      it 'subject is Feedback for Account' do
        described_class.feedback(submission).deliver
        email = ActionMailer::Base.deliveries.last
        expect(email.subject).to include('Feedback for Account')
      end

      context 'when source is unknown' do
        it 'subject is Feedback for Unknown' do
          submission.source = nil
          described_class.feedback(submission).deliver
          email = ActionMailer::Base.deliveries.last
          expect(email.subject).to include('Feedback for Unknown')
        end
      end

      it 'adds submission to the email body' do
        described_class.feedback(submission).deliver
        email = ActionMailer::Base.deliveries.last
        expect(email.body.raw_source).to include('this is some feedback')
      end

      it 'adds submission time to the email body' do
        described_class.feedback(submission).deliver
        email = ActionMailer::Base.deliveries.last
        expect(email.body.raw_source).to match /Submission Time: \d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2} (\+|\-)\d{4}/
      end

      it 'adds submission user agent to the email body' do
        described_class.feedback(submission).deliver
        email = ActionMailer::Base.deliveries.last
        expect(email.body.raw_source).to include("User Agent: #{user_agent}")
      end

      it 'adds submission refer to the email body' do
        described_class.feedback(submission).deliver
        email = ActionMailer::Base.deliveries.last
        expect(email.body.raw_source).to include("Referer: #{referer}")
      end

      it 'adds submission useful to the email body' do
        described_class.feedback(submission).deliver
        email = ActionMailer::Base.deliveries.last
        expect(email.body.raw_source).to include("Was this page useful: #{useful}")
      end  
    end
  end
end

