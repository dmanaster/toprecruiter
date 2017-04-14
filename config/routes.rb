Rails.application.routes.draw do
  root 'episodes#index'

  resources :episodes do
    resources :snapshots
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
