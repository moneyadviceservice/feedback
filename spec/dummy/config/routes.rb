Rails.application.routes.draw do
  root 'example#index'

  scope '/:locale', locale: /en|cy/ do
    mount Feedback::Engine => "/feedback"
  end
end
