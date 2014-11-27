require 'spec_helper'

describe Feedback::Submission do
  let(:body) { 'make this site better' }
  let(:referer) { root_path }
  subject { described_class.new(body: body, referer: referer) }

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

  describe 'how_do_i_hash_on_vim?:referer' do
    it 'returns the url of the referring tool' do
      expect(subject.referer).to eql(referer)
    end
  end
end
