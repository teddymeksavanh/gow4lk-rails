Rails.application.routes.draw do
  resources :strolls do
    resources :types, :paths, :comments, :notes
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'alls', to: 'strolls#strollsAll'
  get 'me', to: 'users#me'
  # get 'me/avatar', to: 'users#meAvatar'
  # post 'me/avatar', to: 'users#updateAvatar'
  put 'me', to: 'users#update'
  delete 'pathsdelete', to: 'paths#deleteAllPaths'
end