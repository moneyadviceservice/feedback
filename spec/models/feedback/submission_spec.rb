require 'spec_helper'

describe Feedback::Submission do
  subject { described_class.new(body: body, user_agent: user_agent, referer: referer, source: source, useful: useful) }

  let(:body) { 'make this site better' }
  let(:referer) { '/' }
  let(:user_agent) { 'some user agent' }
  let(:source) { 'account' }
  let(:useful) { 'yes' }

  describe 'attributes' do
    it 'returns expected attributes' do
      expect(subject.body).to eql(body)
      expect(subject.user_agent).to eql(user_agent)
      expect(subject.source).to eql(source)
      expect(subject.useful).to eql(useful)
    end
  end

  describe '#created_at' do
    it 'returns created_at timestamp' do
      expect(subject.created_at).to be_within(5.seconds).of(Time.now)
    end
  end

  describe '#referer' do
    it 'returns the url of the referring tool' do
      expect(subject.referer).to eql(referer)
    end
  end

  describe 'validations' do
    it 'body cannot be blank' do
      subject.body = ''
      expect(subject).not_to be_valid
    end
  end
end
