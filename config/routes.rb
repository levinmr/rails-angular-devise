# Routes for the server side pages
Rails.application.routes.draw do
  # Routes for devise user authentication
  #
  # We let rails handle this, because devise provides us a nice interface
  #
  devise_for :users, controllers: { sessions: 'sessions' }

  # Home route.  Redirects to devise if no user is signed in, and angular if there
  # is an authenticated user.
  #
  root to: 'home#index'

  # Routes for API calls only.  These shouldn't respond to HTML requests
  #
  namespace :api do

  end
end
