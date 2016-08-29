Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  # resources :users

  # Admin namespace
  namespace :admin, path: 'admin' do
    resources :users
    # Admin root path
    match '/', to: 'dashboard#index', via: [:get], as: :root
  end

  # SubAdmin namespace
  namespace :subadmin, path: 'sub' do
    resources :users
    # SubAdmin root path
    match '/', to: 'dashboard#index', via: [:get], as: :root
  end

  # Manager namespace
  namespace :manager, path: 'm' do
    # Manager root path
    match '/', to: 'dashboard#index', via: [:get], as: :root
  end

  # User namespace
  namespace :user, path: 'u' do
    # User root path
    match '/', to: 'dashboard#index', via: [:get], as: :root
  end

  # Guest namespace
  namespace :guest, path: 'g' do
    # Guest root path
    match '/', to: 'dashboard#index', via: [:get], as: :root
  end

end
