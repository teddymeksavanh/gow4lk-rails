Rails.application.routes.draw do
  resources :strolls do
    resources :types, :paths
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'alls', to: 'strolls#strollsAll'
  get 'me', to: 'users#me'
  put 'me', to: 'users#update'
end