Rails.application.routes.draw do
  root 'example#index'

  mount Feedback::Engine => "/feedback"
end
