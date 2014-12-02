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

    def alternate_locale
      :en
    end

    helper_method :alternate_locale

    def breadcrumbs
      ::BreadcrumbTrail.home
    rescue
      []
    end

    helper_method :breadcrumbs
  end
end

