Rails.application.routes.draw do
  resources :strolls do
    resources :types, :paths
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'strolls/all', to:'strolls#strollsAll'
end