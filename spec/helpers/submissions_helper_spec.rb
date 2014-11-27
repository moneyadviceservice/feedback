require 'spec_helper'

module Feedback
  describe SubmissionsHelper do
    describe '#t_with_source' do
      context 'when allowed source' do
        it 'returns custom translation' do
          helper.stub(:params) { { source: 'account' } }
          helper.instance_variable_set("@virtual_path", 'feedback/submissions/index')
          expect(helper.t_with_source('heading')).to eql(I18n.t('feedback.submissions.index.account.heading'))
        end
      end

      context 'when no source' do
        it 'returns default translation' do
          helper.instance_variable_set("@virtual_path", 'feedback/submissions/index')
          expect(helper.t_with_source('heading')).to eql(I18n.t('feedback.submissions.index.default.heading'))
        end
      end

      context 'when unknown source' do
        it 'returns default translation' do
          helper.stub(:params) { { source: 'unknown' } }
          helper.instance_variable_set("@virtual_path", 'feedback/submissions/index')
          expect(helper.t_with_source('heading')).to eql(I18n.t('feedback.submissions.index.default.heading'))
        end
      end
    end
  end
end
