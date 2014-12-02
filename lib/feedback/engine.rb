module Feedback
  class Engine < ::Rails::Engine
    isolate_namespace Feedback

    initializer :setup_defaults do |app|
      Feedback.parent_controller ||= '::ApplicationController'
    end
  end
end
