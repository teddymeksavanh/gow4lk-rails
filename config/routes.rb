Rails.application.routes.draw do
  resources :strolls do
    # resources :types, :paths, :comments, :notes
    resources :types, :paths, :comments, :notes
    # ressources :types, :paths
  end
  # resources :comments, :notes
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'alls', to: 'strolls#strollsAll'
  get 'allsforce', to:'users#allUserForce'
  get 'me', to: 'users#me'
  # get 'me/avatar', to: 'users#meAvatar'
  # post 'me/avatar', to: 'users#updateAvatar'
  put 'me', to: 'users#update'
  delete 'users/:id', to: 'users#deleteMe'
  get 'users/:id', to: 'users#getUser'
  get 'usersall', to: 'users#allUser'
  get 'commentsall', to: 'comments#allComment'
  put 'users/:id', to: 'users#updateUser'
  delete 'pathsdelete', to: 'paths#deleteAllPaths'

  # types
  get 'types', to: 'types#index'
  post 'types', to: 'types#createType'
  get 'types/stroll', to: 'types#index_stroll'
  post 'types/stroll', to: 'types#create'
  match "types/stroll/:id" => "types#destroy", via: [:delete]
  delete "types/:id" => "types#deleteType"

  # comments
  # get 'allscomments', to: 'comments#commentsAll'
  # post 'comments', to:'comments#create'
end