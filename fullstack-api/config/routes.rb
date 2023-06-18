Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'pets', to: 'pets#index', as: 'pets' # and filter
      get 'pets/:id', to: 'pets#show', as: 'pet'
      post 'pets', to: 'pets#create'
      patch 'pets/:id', to: 'pets#update'
      delete 'pets/:id', to: 'pets#destroy'
    end
  end

end
