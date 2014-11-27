module Feedback
  module SubmissionsHelper
    def t_with_source(*args)
      original_key = args[0]
      namespace = namespace_from_source(params[:source])
      new_key = ".#{namespace}.#{original_key}"

      t(new_key, *args[1..-1])
    end

    private

    def available_sources
      I18n.t('feedback.submissions.index').stringify_keys.keys
    end

    def namespace_from_source(source)
      available_sources.include?(source) ? source : 'default'
    end
  end
end
