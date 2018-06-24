Rails.application.routes.draw do
  resources :strolls do
    resources :types, :paths
  end
end