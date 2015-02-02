require 'active_model'

module Feedback
  class Submission
    include ::ActiveModel::Model

    attr_accessor :body, :created_at, :referer, :user_agent, :source, :helpful

    define_model_callbacks :initialize
    after_initialize :init_created_at

    validates :body, presence: true

    def initialize(*args)
      run_callbacks :initialize do
        super
      end
    end

    private

    def init_created_at
      self.created_at = Time.now
    end
  end
end
