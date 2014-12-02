module Feedback
  class ApplicationController < Feedback.parent_controller.constantize

    def alternate_options
      { }
    end

    helper_method :alternate_options

    def alternate_url
      ''
    end

    helper_method :alternate_url
  end
end

