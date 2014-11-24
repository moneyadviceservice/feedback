require 'spec_helper'

describe Feedback::Submission do
  describe '#body' do
    let(:body) { 'make this site better' }
    subject { described_class.new(body: body) }

    it 'returns feedback body' do
      expect(subject.body).to eql(body)
    end
  end
end
