require 'spec_helper'

describe Feedback::Submission do
  let(:body) { 'make this site better' }
  subject { described_class.new(body: body) }

  describe '#body' do
    it 'returns feedback body' do
      expect(subject.body).to eql(body)
    end
  end

  describe '#created_at' do
    it 'returns created_at timestamp' do
      expect(subject.created_at).to be_within(5.seconds).of(Time.now)
    end
  end
end
