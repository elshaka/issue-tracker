Rails.application.routes.draw do
  namespace :api do
    resources :issues
  end
end
