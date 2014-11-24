Feedback::Engine.routes.draw do
  root 'submissions#index'

  resources :submissions, only: [:index, :create]
end
