require 'spec_helper'

describe Feedback::Submission do
  let(:body) { 'make this site better' }
  let(:user_agent) { 'some user agent' }
  subject { described_class.new(body: body, user_agent: user_agent) }

  describe 'attributes' do
    it 'returns expected attributes' do
      expect(subject.body).to eql(body)
      expect(subject.user_agent).to eql(user_agent)
    end
  end

  describe '#created_at' do
    it 'returns created_at timestamp' do
      expect(subject.created_at).to be_within(5.seconds).of(Time.now)
    end
  end
end
