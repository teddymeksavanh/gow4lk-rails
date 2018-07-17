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
  get 'me', to: 'users#me'
  # get 'me/avatar', to: 'users#meAvatar'
  # post 'me/avatar', to: 'users#updateAvatar'
  put 'me', to: 'users#update'
  get 'users/:id', to: 'users#getUser'
  get 'usersall', to: 'users#allUser'
  get 'commentsall', to: 'comments#allComment'
  put 'users/:id', to: 'users#updateUser'
  delete 'pathsdelete', to: 'paths#deleteAllPaths'

  # comments
  # get 'allscomments', to: 'comments#commentsAll'
  # post 'comments', to:'comments#create'
end