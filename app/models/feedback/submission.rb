require 'active_model'

module Feedback
  class Submission
    include ::ActiveModel::Model

    attr_accessor :body
  end
end
