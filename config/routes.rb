Rails.application.routes.draw do
  # new Types

  resources :strolls do
    # resources :types, :paths, :comments, :notes
    resources :paths, :comments, :notes
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
  # get 'types', to: 'types#index'
  # post 'types', to: 'types#createType'
  # get 'types/stroll/:id', to: 'types#index_stroll'
  # put 'types/:id/stroll/:stroll_id', to: 'types#updateStrollType'
  # delete 'types/:id/stroll/:stroll_id', to: 'types#deleteStrollType'
  # post 'types/stroll/:stroll_id', to: 'types#postStrollType'
  # match "types/stroll/:id" => "types#destroy", via: [:delete]
  # delete "types/:id" => "types#deleteType"

  # Types
  get 'types', to: 'types#index'
  get 'types/:id', to: 'types#show'
  post 'types', to: 'types#create'
  put 'types/:id', to: 'types#update'
  delete 'types/:id', to: 'types#destroy'

  # new Strolls Types
  get 'strolls/:id/types', to: 'strolltypes#index'
  get 'strolls/:stroll_id/types/:id', to: 'strolltypes#show'
  post 'strolls/:stroll_id/types', to: 'strolltypes#create'
  put 'strolls/:stroll_id/types/:id', to: 'strolltypes#update'
  delete 'strolls/:stroll_id/types/:id', to: 'strolltypes#destroy'

  # comments
  # get 'allscomments', to: 'comments#commentsAll'
  # post 'comments', to:'comments#create'
end